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
    @IBOutlet private weak var photoView: UIImageView!
    
    var viewModel: AboutViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorLabel.text = viewModel.authorName
        photoView.image = viewModel.authorPhoto
        photoView.layer.cornerRadius = photoView.frame.width / 2
        photoView.layer.masksToBounds = true
    }

    @IBAction private func dismissPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
