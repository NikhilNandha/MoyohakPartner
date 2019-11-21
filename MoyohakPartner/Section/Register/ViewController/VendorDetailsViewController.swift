//
//  VendorDetailsViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 21/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class VendorDetailsViewController: UIViewController {

    @IBOutlet var imageCircle1: UIImageView!
    @IBOutlet var imageCircle2: UIImageView!
    @IBOutlet var imageCircle3: UIImageView!
    @IBOutlet var imageCircle4: UIImageView!
    @IBOutlet var imageCircle5: UIImageView!
    
    @IBOutlet var imageLine1: UIImageView!
    @IBOutlet var imageLine2: UIImageView!
    @IBOutlet var imageLine3: UIImageView!
    @IBOutlet var imageLine4: UIImageView!
    
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet var buttonPrev: UIButton!
    
    @IBOutlet var mainScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Button Tapped Event -

    
    @IBAction func nextTapped(sender: UIButton) {
        
    }
    
    @IBAction func previousTapped(sender: UIButton) {
        
    }

}
