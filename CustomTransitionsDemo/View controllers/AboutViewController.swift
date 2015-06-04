//
//  AboutViewController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet private weak var authorLabel: UILabel!
    
    let viewModel = AboutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorLabel.text = viewModel.authorName
    }

    @IBAction private func dismissPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
