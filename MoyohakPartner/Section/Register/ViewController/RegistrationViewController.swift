//
//  RegistrationViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class RegistrationViewController: SuperViewController {

    @IBOutlet var textfieldMobile: UITextField!
    @IBOutlet var textfieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Button Tapped Events
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        if ViewNavigator.shared.parentViewController.isKind(of: LoginViewController.self) {
            ViewNavigator.shared.navigateBack()
        }
    }
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        RegistrationViewModel.showOTPScreen(navigationType: .Push, parentViewController: self)
    }

}
