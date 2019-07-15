
import Foundation
import UIKit

public class DAO {
    
    public static var instance = DAO()
    
    func getMessages(completionHandler: @escaping HandleMessageResponse) {
        Service.instance.getMessages(completionHandler: completionHandler)
    }
    
    func login(loginViewModel: LoginViewModel,
               completionHandler: @escaping HandleLoginResponse) {
        Service.instance.login(loginViewModel: loginViewModel, completionHandler: completionHandler)
    }

}
