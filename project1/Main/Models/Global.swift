//
//  Global.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/27/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import Foundation
import RealmSwift

struct Urls {
    static let homeUrl = "http://192.168.1.250:8000/api/v1/"
    static let kbtuUrl = "http://172.16.83.246:8000/api/v1/"
}

private struct Constants {
    static let authorizationStoryboard = "Authentication"
    static let authId = "authenticationID"
    static let mainStoryboard = "Main"
    static let mainId = "mainId"
}
struct Storyboard {
    static var authorizationPage: UIViewController {
        let authorization = UIStoryboard(name: Constants.authorizationStoryboard, bundle: nil)
        return authorization.instantiateViewController(withIdentifier: Constants.authId)
    }
    static var mainPage: UITabBarController {
        let main = UIStoryboard(name: Constants.mainStoryboard, bundle: nil)
        return main.instantiateViewController(withIdentifier: Constants.mainId) as! UITabBarController
    }
}


class RecipeObject: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var category = ""
    @objc dynamic var time = ""
    @objc dynamic var imgUrl = ""
    @objc dynamic var portion = 0
    @objc dynamic var difficulty = ""
}


