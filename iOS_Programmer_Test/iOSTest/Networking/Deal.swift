

import Foundation
import Alamofire

public class Deal {
    
    public static var instance = Deal()

    public func getMessages() -> URLRequest {
        return URLRequest(url: URL(string: "http://dev.datechnologies.co/Tests/scripts/chat_log.php")!)
    }
    
    public func getLogin() -> String {
        return "http://dev.datechnologies.co/Tests/scripts/login.php"
    }
    
}
