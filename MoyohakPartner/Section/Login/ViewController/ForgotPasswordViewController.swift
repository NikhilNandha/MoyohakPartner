//
//  ForgotPasswordViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: SuperViewController {

    @IBOutlet var textfieldMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Button Tapped Events -
    
    @IBAction func resetButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped() {
        ViewNavigator.shared.navigateBack()
    }
    

}
