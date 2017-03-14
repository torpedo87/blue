//
//  main.swift
//  rect
//
//  Created by Jun woo Park on 2017. 3. 14..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

print("Hello, World!")

class MyRect {
    var pointA : CGPoint
    var pointB : CGPoint
    var pointC : CGPoint
    var pointD : CGPoint
    
    init() {
        pointA = CGPoint(x : 0, y : 0)
        pointB = CGPoint(x : 0, y : 0)
        pointC = CGPoint(x : 0, y : 0)
        pointD = CGPoint(x : 0, y : 0)
    }
    
    init(origin : CGPoint, width : Double, height : Double) {
        pointA = origin
        pointB = CGPoint(x : origin.x, y : origin.y + CGFloat(height))
        pointC = CGPoint(x : origin.x + CGFloat(width), y : origin.y + CGFloat(height))
        pointD = CGPoint(x : origin.x + CGFloat(width), y : origin.y)
    }
    
    func moveTo(delta : CGPoint) {
        pointA = CGPoint(x : pointA.x + delta.x, y : pointA.y + delta.y)
        pointB = CGPoint(x : pointB.x + delta.x, y : pointB.y + delta.y)
        pointC = CGPoint(x : pointC.x + delta.x, y : pointC.y + delta.y)
        pointD = CGPoint(x : pointD.x + delta.x, y : pointD.y + delta.y)
        
    }
}

var rect1 = MyRect()
print(rect1)
var rect2 = MyRect(origin: CGPoint(x : 0, y : 0), width: 3, height: 5)
print(rect2)
rect2.moveTo(delta: CGPoint(x : 3, y : 5))
print(rect2)
