//
//  OrdersViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 17/12/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class OrdersViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.tabBarController?.tabBar.isHidden ?? false {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
