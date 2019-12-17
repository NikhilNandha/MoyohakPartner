//
//  SuperViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            print("isMovingFromParent()") // dismiss for push viewController
            ViewNavigator.shared.updateStoredPropertiesAfterDismiss()
        }
        if self.isBeingDismissed {
            print("isBeingDismissed()") // dismiss for modal that doesn't has navigationController
            ViewNavigator.shared.updateStoredPropertiesAfterDismiss()
        }
        if self.navigationController?.isBeingDismissed ?? false {
            print("navigationController?.isBeingDismissed()") // dismiss for modal that has navigationController
            ViewNavigator.shared.updateStoredPropertiesAfterDismiss()
        }
    }
    

}
