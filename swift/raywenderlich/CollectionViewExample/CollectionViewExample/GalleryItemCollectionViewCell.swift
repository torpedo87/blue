//
//  GalleryItemCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Jun woo Park on 2017. 4. 3..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell : UICollectionViewCell {
    @IBOutlet var itemImageView: UIImageView!
    
    func setGalleryItem(_ item:GalleryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
    }
    
}
