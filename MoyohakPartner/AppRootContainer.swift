//
//  AppRootContainer.swift
//  Moyohak
//
//  Created by Nikhil Nandha on 28/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

class AppRootContainer {
    
    static func setTabBar(window: UIWindow?) {
        AppRootContainer.setNavigationAppearances()
        
        window?.rootViewController = TabBar.shared.initialize()
        window?.backgroundColor = UIColor.white
        if let navController = TabBar.shared.controllers[0] as? UINavigationController {
            ViewNavigator.shared.setInitialCurrentViewController(controller: navController.viewControllers[0])
        }else {
            ViewNavigator.shared.setInitialCurrentViewController(controller: TabBar.shared.controllers[0])
        }
    }
    
    static func setLoginScreen(window: UIWindow?) {
        AppRootContainer.setNavigationAppearances()
        
        let introNC = NavigatorController().LoginNC
        window?.rootViewController = introNC
        window?.backgroundColor = UIColor.white
        ViewNavigator.shared.setInitialCurrentViewController(controller: introNC.viewControllers[0])
        
    }
    
    static func setNavigationAppearances() {
        UINavigationBar.appearance().barTintColor = UIColor.ThemeColorPrimary
        UINavigationBar.appearance().tintColor = UIColor.white
        
        //Removes think black line at bottom from navigation bar
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.MuliBold(21), NSAttributedString.Key.foregroundColor : UIColor.white]
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(#imageLiteral(resourceName: "Transparent"), for: .normal, barMetrics: .default)
    }
    
}
