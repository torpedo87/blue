//
//  FlickrPhotosViewController.swift
//  FlickrSearch
//
//  Created by Jun woo Park on 2017. 3. 30..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

final class FlickrPhotosViewController: UICollectionViewController {
    
    //셀 아이디값
    fileprivate let reuseIdentifier = "FlickrCell"
    //마진
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    fileprivate var searches = [FlickrSearchResults]()
    fileprivate let flickr = Flickr()
    
    fileprivate let itemsPerRow: CGFloat = 3
}

private extension FlickrPhotosViewController {
    //indexpath로 사진 가져오기
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches[(indexPath as NSIndexPath).section].searchResults[(indexPath as IndexPath).row]
    }
}


extension FlickrPhotosViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 1 After adding an activity view, use the Flickr wrapper class I provided to search Flickr for photos that match the given search term asynchronously. When the search completes, the completion block will be called with a the result set of FlickrPhoto objects, and an error (if there was one).
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        
        flickr.searchFlickrForTerm(textField.text!) {
            results, error in
            
            
            activityIndicator.removeFromSuperview()
            
            
            if let error = error {
                // 2 Log any errors to the console. Obviously, in a production application you would want to display these errors to the user.
                print("Error searching : \(error)")
                return
            }
            
            if let results = results {
                // 3 The results get logged and added to the front of the searches array
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                // 4 At this stage, you have new data and need to refresh the UI. You’re using the reloadData() method, which works just like it does in a table view.
                self.collectionView?.reloadData()
            }
        }
        
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
}


extension FlickrPhotosViewController {
    //1 There’s one search per section, so the number of sections is the count of the searches array.
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
    
    //2 The number of items in a section is the count of the searchResults array from the relevant FlickrSearch object.
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count
    }
    
    //3 This is a placeholder method just to return a blank cell – you’ll be populating it later. Note that collection views require you to have registered a cell with a reuse identifier, or a runtime error will occur.

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1 The cell coming back is now a FlickrPhotoCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! FlickrPhotoCell
        //2 You need to get the FlickrPhoto representing the photo to display, using the convenience method from earlier
        let flickrPhoto = photoForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3 You populate the image view with the thumbnail
        cell.imageView.image = flickrPhoto.thumbnail
        
        return cell
    }
}


extension FlickrPhotosViewController : UICollectionViewDelegateFlowLayout {
    //1 collectionView(_:layout:sizeForItemAt:) is responsible for telling the layout the size of a given cell

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2 Here, you work out the total amount of space taken up by padding. There will be n + 1 evenly sized spaces, where n is the number of items in the row. The space size can be taken from the left section inset. Subtracting this from the view’s width and dividing by the number of items in a row gives you the width for each item. You then return the size as a square
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3 collectionView(_:layout:insetForSectionAt:) returns the spacing between the cells, headers, and footers. A constant is used to store the value.

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4 This method controls the spacing between each line in the layout. You want this to match the padding at the left and right.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
