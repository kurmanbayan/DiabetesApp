//
//  RegisterViewController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/28/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
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
        
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)
        
        createButton.layer.cornerRadius = 20
        createButton.layer.masksToBounds = true
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        User.userRegister(nameTextField.text!, emailTextField.text!, passwordTextField.text!) { (userData, message) in
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
