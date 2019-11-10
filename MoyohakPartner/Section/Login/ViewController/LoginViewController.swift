//
//  LoginViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Button Tapped Events
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        RegistrationViewModel.showRegistrationScreen(navigationType: .Push, parentViewController: self)
    }
    
}
