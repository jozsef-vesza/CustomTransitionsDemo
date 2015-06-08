//
//  Author.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 08/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

struct Author {
    
    let name: String
    let photo: UIImage
    let socialUrl: NSURL
    let socialHandle: String
    
    init(name: String, withPhoto photo: UIImage, withSocialUrl socialUrl: NSURL, withHandle handle: String) {
        
        self.name = name
        self.photo = photo
        self.socialUrl = socialUrl
        self.socialHandle = handle
    }
}