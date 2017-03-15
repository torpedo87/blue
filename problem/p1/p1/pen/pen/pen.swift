//
//  pen.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 15..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class CXPen {
    private var brand : String
    private var color : String
    private var usage : Int
    
    init(withBrand : String) {
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
    func setBrand(_ name: String) {
        brand = name
    }
    func setColor(_ name: String) {
        color = name
    }
    func setUsage(_ name: Int) {
        usage = name
    }
    
    func printDescription(){
        print("brand is \(brand), color is \(color), usage is \(usage)")
    }
}
