//
//  NavigatorController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

struct Storyboard {
    let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

struct NavigatorController {
    
    //MARK: - Login  & Registration -
    
    let Login : LoginViewController = Storyboard().main.instantiateViewController(identifier: "LoginViewController")
    let LoginNC : UINavigationController = Storyboard().main.instantiateViewController(identifier: "LoginViewController_NC")
    
    let Registration : RegistrationViewController = Storyboard().main.instantiateViewController(identifier: "RegistrationViewController")
    let RegistrationNC : UINavigationController = Storyboard().main.instantiateViewController(identifier: "RegistrationViewController_NC")
    
    let OTP : OTPViewController = Storyboard().main.instantiateViewController(identifier: "OTPViewController")
    let OTPNC : UINavigationController = Storyboard().main.instantiateViewController(identifier: "OTPViewController_NC")
    
    let ForgotPassword : ForgotPasswordViewController = Storyboard().main.instantiateViewController(identifier: "ForgotPasswordViewController")
    let ForgotPasswordNC : UINavigationController = Storyboard().main.instantiateViewController(identifier: "ForgotPasswordViewController_NC")
}
