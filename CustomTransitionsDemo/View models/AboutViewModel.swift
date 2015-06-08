//
//  AboutViewModel.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

struct AboutViewModel {
    
    let authorStore: AuthorStore
    
    init(authorStore: AuthorStore) {
        self.authorStore = authorStore
    }
    
    var author: Author {
        return authorStore.defaultAuthor
    }
    
    var authorName: String {
        return author.name
    }
    
    var authorPhoto: UIImage {
        return author.photo
    }
}