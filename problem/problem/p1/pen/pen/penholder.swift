//
//  penholder.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 15..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class PenHolder {
    private var pens : [CXPen]
    private var usage : Int
    private var capacity : Int
    
    init(withCapacity : Int) {
        pens = [CXPen]()
        usage = Int()
        capacity = withCapacity
    }
    
    func add(pen : CXPen) {
        pens.append(pen)
    }
    
    func remove(penIndex : Int) {
        pens.remove(at: penIndex)
    }
    
    func getUsage()  {
        usage = Int(Double(pens.count) / Double(capacity) * 100)
    }
    
    func printDescription() {
        print("pens are \(pens), usage is \(usage), capacity is \(capacity)")
    }
}
