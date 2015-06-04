//
//  DetailViewController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var photoImageView: UIImageView!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = viewModel.photoImage
    }
}
