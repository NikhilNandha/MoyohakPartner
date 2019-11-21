//
//  VendorShopDetailsViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 21/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class VendorShopDetailsViewController: SuperViewController {

    @IBOutlet var textfieldShopName: CustomTextField!
    @IBOutlet var textfieldState: CustomTextField!
    @IBOutlet var textfieldCity: CustomTextField!
    @IBOutlet var textfieldPincode: CustomTextField!
    @IBOutlet var textfieldShopAddress: CustomTextField!
    @IBOutlet var textfieldUseCurrLocaiton: CustomTextField!
    @IBOutlet var textfieldEnterLocation: CustomTextField!
    @IBOutlet var textfieldOpenTime: CustomTextField!
    @IBOutlet var textfieldCloseTime: CustomTextField!
    @IBOutlet var textfieldCloseOn: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Button Tapped Events -

    @IBAction func nextTapped() {
        
    }
    
}
