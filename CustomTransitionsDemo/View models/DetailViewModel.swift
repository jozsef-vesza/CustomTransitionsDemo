//
//  DetailViewModel.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

struct DetailViewModel {
    
    let photoStore: PhotoStore
    let selectedIndex: Int
    
    init(photoStore: PhotoStore, selectedIndex: Int) {
        self.photoStore = photoStore
        self.selectedIndex = selectedIndex
    }
    
    var authorName: String {
        return photoStore.photos[selectedIndex].author
    }
    
    var photoImage: UIImage? {
        return photoStore.photos[selectedIndex].image
    }
}