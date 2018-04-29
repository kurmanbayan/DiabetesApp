//
//  Category.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

struct Category: Mappable {
    init?(map: Map) {}

    var id = 0
    var name = ""
    var imgUrl = ""
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imgUrl <- map["imgPath"]
    }
    
    static func getCategories(_ completion: @escaping ([Category]?, String?) -> Void) {
        let url = Urls.kbtuUrl + "category/"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = value as! [String: Any]
                    let code = json["code"] as! Int
                    switch code {
                        case 0:
                            let data = json["categories"] as! [[String:Any]]
                            completion(data.map { Category (JSON: $0)! }, nil)
                        default: completion(nil, "error")
                    }
                case .failure(let error):
                    completion(nil, error.localizedDescription)
            }
        }
    }
}
