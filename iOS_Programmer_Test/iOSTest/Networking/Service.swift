
import Foundation
import Alamofire

typealias HandleMessageResponse = (MessageResponse?, String?, String?) -> Void
typealias HandleLoginResponse = (LoginResponse?, String?, String?) -> Void


public class Service {
    
    public static var instance = Service()
    
    func getMessages(completionHandler: @escaping HandleMessageResponse) {
        let urlRequest = Deal.instance.getMessages()
        Alamofire.request(urlRequest)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        if let data = response.data {
                            let decoder = JSONDecoder()
                            let serviceResponse: MessageResponse = try decoder.decode(MessageResponse.self, from: data)
                            
                            let ms = Int((response.timeline.requestDuration.truncatingRemainder(dividingBy: 1) * 1000))
                            let requestDuration = "\(ms)"
                            
                            completionHandler(serviceResponse, nil, requestDuration)
                        }
                    } catch let error {
                        completionHandler(nil, Text.Error.description + error.localizedDescription, nil)
                    }
                case .failure(let error):
                    completionHandler(nil, error.localizedDescription, nil)
                }
        }
    }
    
    func login(loginViewModel: LoginViewModel,
               completionHandler: @escaping HandleLoginResponse) {
        
        let urlRequest = Deal.instance.getLogin()
        
        guard let email = loginViewModel.email,
            let password = loginViewModel.password else { return }
        
        let parameters = [
            Text.Email.description: email,
            Text.password.description: password
        ]
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(urlRequest,
                          method: .post,
                          parameters: parameters,
                          encoding:  URLEncoding.httpBody,
                          headers: headers)
            .validate()
            .responseJSON { response in
            switch(response.result) {
            case.success:
                do {
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        let serviceResponse: LoginResponse = try decoder.decode(LoginResponse.self, from: data)
                        let ms = Int((response.timeline.requestDuration.truncatingRemainder(dividingBy: 1) * 1000))
                        let requestDuration = "\(ms)"
                        completionHandler(serviceResponse, nil, requestDuration)
                    }
                } catch let error {
                    completionHandler(nil, error.localizedDescription, nil)
                }
            case.failure(let error):
                if response.response?.statusCode == CONSTANTS.UNAUTHORIZED_STATUS_CODE {
                    completionHandler(nil, Text.UserOrPasswordIncorrect.description, nil)
                } else {
                    completionHandler(nil, Text.Error.description + error.localizedDescription, nil)
                }
            }
        }
    }
    
    
}


