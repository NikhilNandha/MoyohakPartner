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

class ViewNavigator: NSObject/*, UINavigationBarDelegate*/ {
    
    static let shared = ViewNavigator()
    
    private(set) var currentViewController: UIViewController?
    private var parentViewControllers = [UIViewController]()
    
    /*
     Returns parent view controller
     */
    var parentViewController: UIViewController {
        get { parentViewControllers[parentViewControllers.count-1] }
    }
    
    private(set) var navigationType: NavigationType?
    
    //MARK: - Public push pull methods -
    
    
    func navigate(viewController: UIViewController, parentViewController: UIViewController, navigationType: NavigationType) {
        switch navigationType {
        case .Push:
            guard let _ = parentViewController.navigationController else { return }
            
//            parentViewController.navigationController?.navigationBar.delegate = self
            setViewControllers(current: viewController, parent: parentViewController, navType: navigationType)
            parentViewController.navigationController?.pushViewController(viewController, animated: true)
            
            break
        case .Present:
            
            setViewControllers(current: viewController, parent: parentViewController, navType: navigationType)
            parentViewController.present(viewController, animated: true, completion: nil)
            
            break
        }
    }
    
    /*
     Use this method to Pop or Dismiss
     */
    func navigateBack() {
        
//        self.updateStoredPropertiesAfterDismiss()
        
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
    
//    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
//       navigateBack()
//    }
    
    //MARK: - Public Setters -
    
    /*
     Use this setter to set current and parent view controller while setting App Root ViewController
     */
    func setInitialCurrentViewController(controller: UIViewController) {
        currentViewController = controller
        parentViewControllers = [UIViewController]()
    }
    
    /*
     Call this methods to update current and parent view controller after Dismiss or Pop
     in viewWillDisappear by checking this flags
     isMovingFromParent or isBeingDismissed or navigationController?.isBeingDismissed
     */
    func updateStoredPropertiesAfterDismiss() {
        
        if (currentViewController != nil) && (parentViewControllers.count > 0) {
            
            //Set current view controller as Last View Controller
            currentViewController = parentViewControllers[parentViewControllers.count-1]
            
            //Remove dismissed view controller i.e. Last View Controller
            parentViewControllers.remove(at: parentViewControllers.count-1)
        }
        
    }
    
    //MARK: - Stored properties methods -
    
    
    private func setViewControllers(current: UIViewController, parent: UIViewController, navType: NavigationType) {
        currentViewController = current
        parentViewControllers.append(parent)
        navigationType = navType
    }
    
    
}
