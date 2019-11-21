//
//  VendorDetailsViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 21/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class VendorDetailsViewController: UIViewController, PaginControl {
    
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
    
    var shopDetailsVC : VendorShopDetailsViewController!
    var contactDetailsVC : VendorContactDetailsViewController!
    var socialMediaDetailsVC  : VendorSocialMediaDetailsViewController!
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        shopDetailsVC = NavigatorController().VendorShopDetails
        contactDetailsVC = NavigatorController().VendorContactDetails
        socialMediaDetailsVC = NavigatorController().VendorSocialMediaDetails
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        shopDetailsVC.view.frame = CGRect.init(origin: CGPoint.init(x: 0.0, y: 0.0), size: CGSize.init(width: shopDetailsVC.view.bounds.width, height: shopDetailsVC.view.bounds.height))
        contactDetailsVC.view.frame = CGRect.init(origin: CGPoint.init(x: shopDetailsVC.view.bounds.width, y: 0.0), size: CGSize.init(width: contactDetailsVC.view.bounds.width, height: contactDetailsVC.view.bounds.height))
        socialMediaDetailsVC.view.frame = CGRect.init(origin: CGPoint.init(x: shopDetailsVC.view.bounds.width + contactDetailsVC.view.bounds.width, y: 0.0),
                                                      size: CGSize.init(width: contactDetailsVC.view.bounds.width, height: contactDetailsVC.view.bounds.height))
        
        mainScrollView.addSubview(shopDetailsVC.view)
        mainScrollView.addSubview(contactDetailsVC.view)
        mainScrollView.addSubview(socialMediaDetailsVC.view)
        mainScrollView.contentSize = CGSize.init(width: shopDetailsVC.view.bounds.width+contactDetailsVC.view.bounds.width+socialMediaDetailsVC.view.bounds.width, height: shopDetailsVC.view.bounds.height)
    }

    
    
    func nextPage() {
        currentIndex = currentIndex < 2 ? currentIndex+1 : 2
        mainScrollView.contentOffset = CGPoint.init(x: view.frame.size.width * CGFloat(currentIndex), y: 0)
    }
    
    func previousPage() {
        currentIndex = currentIndex > 0 ? currentIndex-1 : 0
        mainScrollView.contentOffset = CGPoint.init(x: view.frame.size.width * CGFloat(currentIndex), y: 0)
    }
    
    
    // MARK: - Button Tapped Event -

    
    @IBAction func nextTapped(sender: UIButton) {
        nextPage()
    }
    
    @IBAction func previousTapped(sender: UIButton) {
        previousPage()
    }

}
