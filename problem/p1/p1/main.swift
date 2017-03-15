//
//  main.swift
//  p1
//
//  Created by Jun woo Park on 2017. 3. 14..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

print("Hello, World!")

let pen1 = CXPen(withBrand: "monami")
pen1.setColor("red")
pen1.setUsage(50)

let pen2 = CXPen(withBrand: "sharp")
pen2.setColor("blue")
pen2.setUsage(10)

let pen3 = CXPen(withBrand: "zebra")
pen3.setColor("black")
pen3.setUsage(100)

let holder = PenHolder(withCapacity: 5)
holder.add(pen: pen1)
holder.add(pen: pen2)
holder.add(pen: pen3)
holder.printDescription()
print(holder.usage)



