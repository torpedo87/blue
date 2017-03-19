//
//  CXPen.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 19..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class CXPen {
    //펜의 공통 속성
     var brandName: String
     var colorName: String
     var usagePercent: Int
    
    init(withBrand: String) {
        brandName = withBrand
        colorName = String()
        usagePercent = Int()
    }
    
    //getter
    func brand() -> String {
        return brandName
    }
    
    func color() -> String {
        return colorName
    }
    
    func usage() -> Int {
        return usagePercent
    }
    
    //setter
    func setBrand(_ name: String) {
        brandName = name
    }
    
    func setColor(_ name: String) {
        colorName = name
    }
    
    func setUsage(_ percent: Int) {
        usagePercent = percent
    }
    
    //display
    func printDescription() {
        print("Brand: \(self.brandName), color: \(self.colorName), usage: \(self.usagePercent)")
    }
}


//이건 뭐지...???
extension CXPen: CustomStringConvertible {
    var description: String {
        return "Brand: \(self.brandName), color: \(self.colorName), usage: \(self.usagePercent)"
    }
}
