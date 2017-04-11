//
//  FlickrSearchResults.swift
//  FlickrSearch
//
//  Created by Jun woo Park on 2017. 3. 30..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

struct FlickrSearchResults {
    //검색 단어
    let searchTerm : String
    
    //검색 결과사진
    //FlickrPhoto 인스턴스를 배열로 받는다
    let searchResults : [FlickrPhoto]
}
