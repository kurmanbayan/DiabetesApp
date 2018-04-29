//
//  Authentication.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/28/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

struct User: Mappable {
    init?(map: Map) {}
    
    var id = 0
    var fullname = ""
    var email = ""
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        fullname <- map["fullname"]
        email <- map["email"]
    }
    
    static func userLogin(_ email: String, _ password: String, _ completion: @escaping (User?, String?) -> Void) {
        let url = Urls.kbtuUrl + "login/"
        let parameters = ["email": email, "password": password]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = value as! [String: Any]
                let code = json["id"] as? Int ?? nil
                if code != nil {
                    print(json)
                    completion(User(JSON: json)!, nil)
                }
                else {
                    completion(nil, "error")
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    static func userRegister(_ fullname: String, _ email: String, _ password: String, _ completion: @escaping (User?, String?) -> Void) {
        let url = Urls.kbtuUrl + "register/"
        let parameters = ["fullname": fullname, "email": email, "password": password]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = value as! [String: Any]
                let code = json["id"] as? Int ?? nil
                if code != nil {
                    print(json)
                    completion(User(JSON: json)!, nil)
                }
                else {
                    completion(nil, "error")
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
