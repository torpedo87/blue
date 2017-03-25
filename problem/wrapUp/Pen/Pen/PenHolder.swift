//
//  PenHolder.swift
//  Pen
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class PenHolder {
    var pens: [CXPen]
    var usage: Int
    var capacity: Int
    
    init(withCapacity: Int) {
        pens = [CXPen]()
        capacity = withCapacity
        usage = Int(Double(pens.count) / Double(capacity) * 100)
    }
    
    func add(pen: CXPen) {
        pens.append(pen)
        usage = Int(Double(pens.count) / Double(capacity) * 100)
    }
    
    func remove(penIndex: Int) {
        pens.remove(at: penIndex)
        usage = Int(Double(pens.count) / Double(capacity) * 100)
    }
    
    func getUsage() -> Int {
        return Int(Double(pens.count) / Double(capacity) * 100)
    }
    
    func printDescription() {
        print("pens: \(pens), usage: \(usage), capacity: \(capacity)")
    }
}
