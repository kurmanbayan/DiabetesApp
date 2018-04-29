//
//  AuthenticationViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/28/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        loginButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 20
        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor(red: 1, green: 99/255, blue: 34/255, alpha: 1).cgColor
        registerButton.layer.masksToBounds = true
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: nil)
    }
}
