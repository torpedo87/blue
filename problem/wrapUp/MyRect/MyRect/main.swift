//
//  main.swift
//  MyRect
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

print("Hello, World!")

struct MyRect {
    var pointA: CGPoint
    var pointB: CGPoint
    var pointC: CGPoint
    var pointD: CGPoint
    
    init() {
        pointA = CGPoint(x: 0.0, y: 0.0)
        pointB = CGPoint(x: 0.0, y: 0.0)
        pointC = CGPoint(x: 0.0, y: 0.0)
        pointD = CGPoint(x: 0.0, y: 0.0)
    }
    
    init(origin: CGPoint, width: Double, height: Double) {
        pointA = CGPoint(x: Double(origin.x), y: Double(origin.y) + height)
        pointB = CGPoint(x: Double(origin.x) + width, y: Double(origin.y) + height)
        pointC = CGPoint(x: Double(origin.x) + width, y: Double(origin.y))
        pointD = origin
    }
    
}

let rect1 = MyRect()
print(rect1)

let rect2 = MyRect(origin: CGPoint(x: 3.0, y: 3.0), width: 3.0, height: 5.0)
print(rect2)
