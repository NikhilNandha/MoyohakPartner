//
//  TabBarController.swift
//  Moyohak
//
//  Created by Nikhil Nandha on 28/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

class TabBar : NSObject, UITabBarControllerDelegate {
    
    static let shared = TabBar()
    
    private override init() {}
    
    
    private let tabBarController = HomeTabBarController()
    
    var controllers : [UIViewController] {
        get {
            tabBarController.viewControllers ?? [UIViewController]()
        }
    }
    
    public func initialize() -> UITabBarController {
        
        tabBarController.viewControllers = viewControllers()
        tabBarController.selectedIndex = 0
        tabBarController.delegate = self
        tabBarController.tabBar.tintColor = UIColor.ThemeColorPrimary
        
        return tabBarController
        
    }
    
    private func viewControllers() -> [UIViewController] {
        
        let dashboardViewController = NavigatorController().DashboardNC
        dashboardViewController.tabBarItem = UITabBarItem.init(title: "Dashboard", image: UIImage.init(named: "Dashboard"), selectedImage: UIImage.init(named: "Dashboard"))
        
        let masterViewController = NavigatorController().MasterNC
        masterViewController.tabBarItem = UITabBarItem.init(title: "Master", image: UIImage.init(named: "Master"), selectedImage: UIImage.init(named: "Master"))
        
        let uploadViewController = NavigatorController().UploadNC
        uploadViewController.tabBarItem = UITabBarItem.init(title: "Upload", image: UIImage.init(named: "Upload"), selectedImage: UIImage.init(named: "Upload"))
        
        let ordersViewController = NavigatorController().OrdersNC
        ordersViewController.tabBarItem = UITabBarItem.init(title: "Orders", image: UIImage.init(named: "Orders"), selectedImage: UIImage.init(named: "Orders"))
        
        let profileViewController = NavigatorController().ProfileNC
        profileViewController.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage.init(named: "Profile"), selectedImage: UIImage.init(named: "Profile"))
        
        
        return [dashboardViewController, masterViewController, uploadViewController, ordersViewController, profileViewController]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected View Controller -->" + "\(viewController)")
        tabBarController.tabBar.isHidden = false
        
        if let navController = viewController as? UINavigationController {
            ViewNavigator.shared.setInitialCurrentViewController(controller: navController.viewControllers[0])
        }
    }
    
}

