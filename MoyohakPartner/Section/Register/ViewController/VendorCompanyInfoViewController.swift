//
//  VendorCompanyInfoViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 22/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class VendorCompanyInfoViewController: SuperViewController {

    @IBOutlet var segement: UISegmentedControl!
    
    @IBOutlet var viewRetailer: UIView!
    @IBOutlet var viewWorkFromHome: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Tapped Event -

    @IBAction func segementValueChanged(sender: UISegmentedControl) {
        
        if segement.selectedSegmentIndex == 0 {
            viewRetailer.isHidden = false
            viewWorkFromHome.isHidden = true
        }else if segement.selectedSegmentIndex == 1 {
            viewRetailer.isHidden = true
            viewWorkFromHome.isHidden = false
        }
        
    }

}
