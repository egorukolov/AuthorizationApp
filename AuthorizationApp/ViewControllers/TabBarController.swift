//
//  TabBarController.swift
//  AuthorizationApp
//
//  Created by Egor Ukolov on 26.09.2023.
//

import Foundation
import UIKit

class TabBarController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    
    var userName = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello, mr. \(userName)!"
    }
    
    
    @IBAction func logOutButton() {
        //dismiss(animated: true)
    }
    
}
