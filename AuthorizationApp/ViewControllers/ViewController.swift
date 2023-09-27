//
//  ViewController.swift
//  AuthorizationApp
//
//  Created by Egor Ukolov on 10.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func logInButton() {
    }
    
    @IBAction func forgotUserNameButton() {
    }
    
    @IBAction func forgotPasswordButton() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let destinationVC = tabBarController.viewControllers?.first
                as? TabBarController else { return }
        destinationVC.userName = userNameTextField.text ?? ""
    }

}

