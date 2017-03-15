//
//  main.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 15..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

print("Hello, World!")

let pen1 = CXPen(withBrand: "monami")
pen1.setColor("red")
pen1.setUsage(3)
pen1.printDescription()

let pen2 = CXPen(withBrand: "sharp")
pen2.setColor("blue")
pen2.setUsage(2)

let pen3 = CXPen(withBrand: "zebra")
pen3.setColor("black")
pen3.setUsage(3)

let penHolder = PenHolder(withCapacity: 10)
penHolder.add(pen: pen1)
penHolder.add(pen: pen2)
penHolder.add(pen: pen3)
penHolder.remove(penIndex: 1)
penHolder.getUsage()
penHolder.printDescription()
