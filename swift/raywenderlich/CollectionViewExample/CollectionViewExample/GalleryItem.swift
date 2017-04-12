//
//  GalleryItem.swift
//  CollectionViewExample
//
//  Created by Jun woo Park on 2017. 4. 3..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class GalleryItem {
    
    var itemImage: String
    
    init(dataDictionary:Dictionary<String,String>) {
        itemImage = dataDictionary["itemImage"]!
    }
    
    class func newGalleryItem(_ dataDictionary:Dictionary<String,String>) -> GalleryItem {
        return GalleryItem(dataDictionary: dataDictionary)
    }
    
}
