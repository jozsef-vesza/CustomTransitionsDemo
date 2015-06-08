//
//  Photo.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

struct Photo {
    
    var title: String
    var author: String
    var image: UIImage?
    
    init(title: String, withAuthor author: String, withImage image: UIImage?) {
        
        self.title = title
        self.author = author
        self.image = image
    }
}