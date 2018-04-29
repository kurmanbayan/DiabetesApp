//
//  LoginViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/28/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)
        
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)

        loginButton.layer.cornerRadius = 20
        loginButton.layer.masksToBounds = true
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        User.userLogin(emailTextField.text!, passwordTextField.text!) { (userData, message) in
            if let message = message {
                print(message)
            }
            else {
                var user = UserDefaults.standard.array(forKey: "user") as? [String] ?? []
                user.append(userData!.email)
                UserDefaults.standard.set(user, forKey: "user")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "mainId") as UIViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
