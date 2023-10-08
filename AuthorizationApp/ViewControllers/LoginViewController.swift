//
//  ViewController.swift
//  AuthorizationApp
//
//  Created by Egor Ukolov on 10.09.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButton() {
        
        let firstUser = Storage(login: "Miklos", password: "kfvgj4rf")
        
        if userNameTextField.text == firstUser.login &&
            passwordTextField.text == firstUser.password {
            
            performSegue(withIdentifier: "go2NextScreen", sender: nil)
            
        } else {
            
            showAlert(title: "Upsss", message: "Wrong UserName or Password")
            
        }
    }
    
    @IBAction func unwindSegueToViewController(segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(title: "A little hint", message: "Your first nickname in games")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Big hint", message: "You have idea")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let destinationVC = tabBarController.viewControllers?.first
                as? TabBarController else { return }
        destinationVC.userName = userNameTextField.text ?? ""
    }
    
}

// MARK: - Extension
//TextFields (Переход между и скрытие клавиатуры тапом по экрану)

extension LoginViewController: UITextFieldDelegate {
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

// MARK: - Allert

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
