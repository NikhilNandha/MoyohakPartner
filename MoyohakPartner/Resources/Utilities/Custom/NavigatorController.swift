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
    
    let Login = Storyboard().main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    let LoginNC = Storyboard().main.instantiateViewController(withIdentifier: "LoginViewController_NC") as! UINavigationController
    
    let Registration = Storyboard().main.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
    let RegistrationNC = Storyboard().main.instantiateViewController(withIdentifier: "RegistrationViewController_NC") as! UINavigationController
    
    let OTP = Storyboard().main.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
    let OTPNC = Storyboard().main.instantiateViewController(withIdentifier: "OTPViewController_NC") as! UINavigationController
    
    let ForgotPassword = Storyboard().main.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
    let ForgotPasswordNC = Storyboard().main.instantiateViewController(withIdentifier: "ForgotPasswordViewController_NC") as! UINavigationController
}
