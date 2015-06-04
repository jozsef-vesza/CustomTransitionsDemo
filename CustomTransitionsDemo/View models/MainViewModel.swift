//
//  File.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class MainViewModel: NSObject {
    
    let photoStore: PhotoStore
    
    init(photoStore: PhotoStore) {
        self.photoStore = photoStore
        super.init()
    }
    
    var count: Int {
        return photoStore.photos.count
    }
    
    func photoForRow(row: Int) -> Photo {
        return photoStore.photos[row]
    }
    
    func titleForRow(row: Int) -> String {
        return photoStore.photos[row].title
    }
}