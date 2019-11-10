//
//  ViewNavigator.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation
import UIKit

enum NavigationType {
    case Push
    case Present
}

class ViewNavigator {
    
    static let shared = ViewNavigator()
    
    private(set) var currentViewController: UIViewController?
    private var parentViewControllers = [UIViewController]()
    
    var parentViewController: UIViewController {
        get { parentViewControllers[0] }
    }
    
    private(set) var navigationType: NavigationType?
    
    //MARK: - Public push pull methods -
    
    
    func navigate(viewController: UIViewController, parentViewController: UIViewController, navigationType: NavigationType) {
        switch navigationType {
        case .Push:
            guard let _ = parentViewController.navigationController else { return }
            
            setViewControllers(current: viewController, parent: parentViewController, navType: navigationType)
            parentViewController.navigationController?.pushViewController(viewController, animated: true)
            
            break
        case .Present:
            
            setViewControllers(current: viewController, parent: parentViewController, navType: navigationType)
            parentViewController.present(viewController, animated: true, completion: nil)
            
            break
        }
    }
    
    func navigateBack() {
        
        self.updateStoredPropertiesAfterDismiss()
        
        switch navigationType {
        case .Push:
            currentViewController?.navigationController?.popViewController(animated: true)
            break
        case .Present:
            currentViewController?.dismiss(animated: true, completion: nil)
            break
        default: break
        }
    }
    
    
    //MARK: - Stored properties methods -
    
    
    private func setViewControllers(current: UIViewController, parent: UIViewController, navType: NavigationType) {
        currentViewController = current
        parentViewControllers.append(parent)
        navigationType = navType
    }
    
    private func updateStoredPropertiesAfterDismiss() {
        
        if (currentViewController != nil) && (parentViewControllers.count > 0) {
            
            //Set current view controller as Last View Controller
            currentViewController = parentViewControllers[parentViewControllers.count-1]
            
            //Remove dismissed view controller i.e. Last View Controller
            parentViewControllers.remove(at: parentViewControllers.count-1)
        }
        
    }
}
