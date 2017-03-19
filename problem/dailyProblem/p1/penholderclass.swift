//
//  penholderclass.swift
//  p1
//
//  Created by Jun woo Park on 2017. 3. 14..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class PenHolder {
    private var pens : [CXPen]
    private var capacity : Int
    
    //연산프로퍼티
    var usage : Double {
        get {
            return (Double(pens.count) / Double(self.capacity)) * 100
        }
    }
    
    init(withCapacity : Int) {
        pens = [CXPen]()
        capacity = withCapacity
    }
    
    func add(pen : CXPen) {
        pens.append(pen)
    }
    func remove(penIndex : Int) {
        pens.remove(at : penIndex)
    }
    func printDescription() {
        print("Pens : \(pens), Usage : \(usage)")
    }
}
