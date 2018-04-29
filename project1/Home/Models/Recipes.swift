//
//  Recipes.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/25/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct Recipes: Mappable {
    init?(map: Map) {}
    
    var id = 0
    var name = ""
    var category = ""
    var time = ""
    var ingredients: [String] = []
    var instructions: [String] = []
    var imgUrl = ""
    var portion = 0
    var difficulty = ""
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        category <- map["category"]
        time <- map["time"]
        imgUrl <- map["imgPath"]
        difficulty <- map["difficulty"]
        portion <- map["portion"]
        ingredients <- map["ingredients_full"]
        instructions <- map["howto"]
    }
    
    static func getRecipes(_ completion: @escaping ([Recipes]?, String?) -> Void) {
        let url = Urls.kbtuUrl
        
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = value as! [String: Any]
                    let code = json["code"] as! Int
                    switch code {
                        case 0:
                            let data = json["menuList"] as! [[String:Any]]
                            completion(data.map { Recipes (JSON: $0)! }, nil)
                        default: completion(nil, "error")
                    }
                case .failure(let error):
                    completion(nil, error.localizedDescription)
            }
        }
    }
    
    static func getRecipesByCategory(_ id: Int, _ completion: @escaping ([Recipes]?, String?) -> Void) {
        let url = Urls.kbtuUrl + "category/\(id)/"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = value as! [String: Any]
                let code = json["code"] as! Int
                switch code {
                case 0:
                    let data = json["recipeList"] as! [[String:Any]]
                    completion(data.map { Recipes (JSON: $0)! }, nil)
                default: completion(nil, "error")
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
