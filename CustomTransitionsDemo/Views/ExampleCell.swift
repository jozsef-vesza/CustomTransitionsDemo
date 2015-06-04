//
//  ExampleCell.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class ExampleCell: UITableViewCell {
    
    @IBOutlet private weak var mainTitleLabel: UILabel!
    
    var mainTitle: String! {
        didSet {
            mainTitleLabel.text = mainTitle
        }
    }
}