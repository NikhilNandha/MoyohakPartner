//
//  RegistrationViewModel.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewModel {
    
    public static func showRegistrationScreen(navigationType: NavigationType, parentViewController: UIViewController) {
        
        ViewNavigator.shared.navigate(viewController: navigationType == .Push ? NavigatorController().Registration : NavigatorController().RegistrationNC,
                               parentViewController: parentViewController,
                               navigationType: .Push)
    }
    
    public static func showOTPScreen(navigationType: NavigationType, parentViewController: UIViewController) {
        
        ViewNavigator.shared.navigate(viewController: navigationType == .Push ? NavigatorController().OTP : NavigatorController().OTPNC,
                               parentViewController: parentViewController,
                               navigationType: .Push)
    }
    
    public static func showVendorRegistrationScreen(navigationType: NavigationType, parentViewController: UIViewController) {
        
        ViewNavigator.shared.navigate(viewController: navigationType == .Push ? NavigatorController().VendorDetails: NavigatorController().VendorDetailsNC,
                               parentViewController: parentViewController,
                               navigationType: .Push)
    }
    
}
