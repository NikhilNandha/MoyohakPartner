//
//  LoginViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class LoginViewController: SuperViewController {

    @IBOutlet var textfieldMobile: UITextField!
    @IBOutlet var textfieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Button Tapped Events -
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        RegistrationViewModel.showRegistrationScreen(navigationType: .Push, parentViewController: self)
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func forgotPasswordButtonTapped(sender: UIButton) {
        LoginViewModel.showForgotPasswordScreen(navigationType: .Push, parentViewController: self)
    }
}
