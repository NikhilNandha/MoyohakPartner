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
    
    
    let VendorDetails = Storyboard().main.instantiateViewController(withIdentifier: "VendorDetailsViewController") as! VendorDetailsViewController
    let VendorDetailsNC = Storyboard().main.instantiateViewController(withIdentifier: "VendorDetailsViewController_NC") as! UINavigationController
    
    let VendorShopDetails = Storyboard().main.instantiateViewController(withIdentifier: "VendorShopDetailsViewController") as! VendorShopDetailsViewController
    let VendorContactDetails = Storyboard().main.instantiateViewController(withIdentifier: "VendorContactDetailsViewController") as! VendorContactDetailsViewController
    let VendorSocialMediaDetails = Storyboard().main.instantiateViewController(withIdentifier: "VendorSocialMediaDetailsViewController") as! VendorSocialMediaDetailsViewController
    let VendorCompanyInfo = Storyboard().main.instantiateViewController(withIdentifier: "VendorCompanyInfoViewController") as! VendorCompanyInfoViewController
    let VendorPaymentDetails = Storyboard().main.instantiateViewController(withIdentifier: "VendorPaymentDetailsViewController") as! VendorPaymentDetailsViewController
    
}
