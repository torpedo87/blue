//
//  CXPen.swift
//  Pen
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class CXPen {
    var brand: String
    var color: String
    var usage: Int
    
    init(withBrand: String) {
        brand = withBrand
        color = String()
        usage = Int()
    }
    
    //getter
    func getBrand() -> String {
        return brand
    }
    
    func getColor() -> String {
        return color
    }
    
    func getUsage() -> Int {
        return usage
    }
    
    //setter
    func setBrand(_ brandName : String) {
        brand = brandName
    }
    
    func setColor(_ colorName: String) {
        color = colorName
    }
    
    func setUsage(_ usagePercent: Int) {
        usage = usagePercent
    }
    
    func printDescription() {
        print("brand: \(brand), color: \(color), usage: \(usage)")
    }
    
}
