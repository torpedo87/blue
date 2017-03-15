//
//  penclass.swift
//  p1
//
//  Created by Jun woo Park on 2017. 3. 14..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class CXPen {
    private var brandName : String
    private var colorName : String
    private var usagePercent : Int

    init(withBrand : String) {
        brandName = withBrand
        colorName = String()
        usagePercent = Int()
    }
    
    //getter (밖에서 값 가져올 때)
    func brand() -> String {
        return brandName
    }
    
    func color() -> String {
        return colorName
    }
    func usage() -> Int {
        return usagePercent
    }
    
    
    //setter (밖에서 값 넣을 때)
    //outter inner, 매개변수명(_), 전달인자레이블(name)
    func setBrand(_ name : String) {
        brandName = name
    }
    func setColor(_ name : String) {
        colorName = name
    }
    func setUsage(_ percent : Int) {
        usagePercent = percent
    }
    
    //display
    func printDescription() {
        print("Brand: \(self.brandName), Color: \(self.colorName), Usage: \(usagePercent)")
    }
}
