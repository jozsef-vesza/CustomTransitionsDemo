//
//  AuthorStore.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 08/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

struct AuthorStore {
    
    static let sharedInstance = AuthorStore()
    
    let defaultAuthor = Author(
        name: "József Vesza",
        withPhoto: UIImage(named: "avatar")!,
        withSocialUrl: NSURL(string: "https://twitter.com/j_vesza")!,
        withHandle: "@j_vesza")
}