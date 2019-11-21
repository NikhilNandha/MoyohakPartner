//
//  PagingControl.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 21/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import Foundation

protocol PaginControl {
    var currentIndex : Int {get set}
    func nextPage()
    func previousPage()
}
