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
        performSegue(withIdentifier: "go2NextScreen", sender: nil)
    }
    
    @IBAction func unwindSegueToViewController(segue: UIStoryboardSegue) {
        passwordTextField.text = ""
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

// MARK: - Расширение для работы TextFields (Переход между и скрытие клавиатуры тапом по экрану)

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
}

