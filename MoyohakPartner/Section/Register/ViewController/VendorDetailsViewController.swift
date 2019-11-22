//
//  VendorDetailsViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 21/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class VendorDetailsViewController: UIViewController, PaginControl, UIScrollViewDelegate {
    
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
    
    static let nameCircleUnfilled = "ProgressCircleUnfilled"
    static let nameCircleFilled = "ProgressCircleFilled"
    static let nameLineUnfilled = "ProgressLineUnfilled"
    static let nameLineFilled = "ProgressLineFilled"
    
    var shopDetailsVC : VendorShopDetailsViewController!
    var contactDetailsVC : VendorContactDetailsViewController!
    var socialMediaDetailsVC  : VendorSocialMediaDetailsViewController!
    var companyInfoVC  : VendorCompanyInfoViewController!
    var paymentDetails  : VendorPaymentDetailsViewController!
    
    var currentIndex: Int = 0
    var allowHorizontalScroll = false
    var scrollOffset = CGPoint.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        shopDetailsVC = NavigatorController().VendorShopDetails
        contactDetailsVC = NavigatorController().VendorContactDetails
        socialMediaDetailsVC = NavigatorController().VendorSocialMediaDetails
        companyInfoVC = NavigatorController().VendorCompanyInfo
        paymentDetails = NavigatorController().VendorPaymentDetails
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addViewsToScrollView()
    }

    func nextPage() {
        currentIndex = currentIndex < 4 ? currentIndex+1 : 4
        allowHorizontalScroll = true
        mainScrollView.contentOffset = CGPoint.init(x: view.frame.size.width * CGFloat(currentIndex), y: 0)
        allowHorizontalScroll = false
    }
    
    func previousPage() {
        currentIndex = currentIndex > 0 ? currentIndex-1 : 0
        allowHorizontalScroll = true
        mainScrollView.contentOffset = CGPoint.init(x: view.frame.size.width * CGFloat(currentIndex), y: 0)
        allowHorizontalScroll = false
    }
    
    func setProgress() {
        
        initializeProgress()
        
        switch currentIndex {
        case 1:
            imageCircle1.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine1.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
        case 2:
            imageCircle1.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine1.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
            imageCircle2.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine2.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
        case 3:
            imageCircle1.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine1.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
            imageCircle2.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine2.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
            imageCircle3.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine3.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
        case 4:
            imageCircle1.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine1.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
            imageCircle2.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine2.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
            imageCircle3.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine3.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
            imageCircle4.image = UIImage(named: VendorDetailsViewController.nameCircleFilled)
            imageLine4.image = UIImage(named: VendorDetailsViewController.nameLineFilled)
        default:
            break
        }
    }
    
    private func initializeProgress() {
        imageCircle1.image = UIImage(named: VendorDetailsViewController.nameCircleUnfilled)
        imageCircle2.image = UIImage(named: VendorDetailsViewController.nameCircleUnfilled)
        imageCircle3.image = UIImage(named: VendorDetailsViewController.nameCircleUnfilled)
        imageCircle4.image = UIImage(named: VendorDetailsViewController.nameCircleUnfilled)
        imageCircle5.image = UIImage(named: VendorDetailsViewController.nameCircleUnfilled)
        
        imageLine1.image = UIImage(named: VendorDetailsViewController.nameLineUnfilled)
        imageLine2.image = UIImage(named: VendorDetailsViewController.nameLineUnfilled)
        imageLine3.image = UIImage(named: VendorDetailsViewController.nameLineUnfilled)
        imageLine4.image = UIImage(named: VendorDetailsViewController.nameLineUnfilled)
    }
    
    // MARK: - Button Tapped Event -

    
    @IBAction func nextTapped(sender: UIButton) {
        nextPage()
        setProgress()
    }
    
    @IBAction func previousTapped(sender: UIButton) {
        previousPage()
        setProgress()
    }
    
    // MARK: - Scroll View Methods -
    
    func addViewsToScrollView() {
        
        shopDetailsVC.view.frame = CGRect.init(origin: CGPoint.init(x: 0.0, y: 0.0), size: CGSize.init(width: shopDetailsVC.view.bounds.width, height: shopDetailsVC.view.bounds.height))
        
        contactDetailsVC.view.frame = CGRect.init(origin: CGPoint.init(x: shopDetailsVC.view.bounds.width, y: 0.0), size: CGSize.init(width: contactDetailsVC.view.bounds.width, height: contactDetailsVC.view.bounds.height))
        
        socialMediaDetailsVC.view.frame = CGRect.init(origin: CGPoint.init(x: shopDetailsVC.view.bounds.width + contactDetailsVC.view.bounds.width,
                                                                           y: 0.0),
                                                      size: CGSize.init(width: socialMediaDetailsVC.view.bounds.width, height: socialMediaDetailsVC.view.bounds.height))
        
        companyInfoVC.view.frame = CGRect.init(origin: CGPoint.init(x: shopDetailsVC.view.bounds.width + contactDetailsVC.view.bounds.width + socialMediaDetailsVC.view.bounds.width,
                                                                    y: 0.0),
                                               size: CGSize.init(width: companyInfoVC.view.bounds.width, height: companyInfoVC.view.bounds.height))
        
        paymentDetails.view.frame = CGRect.init(origin: CGPoint.init(x: shopDetailsVC.view.bounds.width + contactDetailsVC.view.bounds.width + socialMediaDetailsVC.view.bounds.width + companyInfoVC.view.bounds.width,
                                                                     y: 0.0),
                                                size: CGSize.init(width: paymentDetails.view.bounds.width, height: paymentDetails.view.bounds.height))
        
        
        mainScrollView.addSubview(shopDetailsVC.view)
        mainScrollView.addSubview(contactDetailsVC.view)
        mainScrollView.addSubview(socialMediaDetailsVC.view)
        mainScrollView.addSubview(companyInfoVC.view)
        mainScrollView.addSubview(paymentDetails.view)
        mainScrollView.contentSize = CGSize.init(width: shopDetailsVC.view.bounds.width + contactDetailsVC.view.bounds.width + socialMediaDetailsVC.view.bounds.width + companyInfoVC.view.bounds.width + paymentDetails.view.bounds.width,
                                                 height: shopDetailsVC.view.bounds.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !allowHorizontalScroll {
            scrollView.contentOffset.x = scrollOffset.x
        }else {
            scrollOffset = scrollView.contentOffset
        }
    }

}


