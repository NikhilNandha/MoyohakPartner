//
//  AppConstants.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    
    static let OS_TYPE = "iOS"
    
    static let APP_NAME = "Moyohak Partner"

    // MARK:- Screen sizes -
    static let SCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let KEYBOARD_ANIMATION_DURATION = 0.3
    
}
