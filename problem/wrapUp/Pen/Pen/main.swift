//
//  main.swift
//  Pen
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

let monamiPen = CXPen(withBrand: "monami")
let sharpPen = CXPen(withBrand: "sharp")

let penHolder = PenHolder(withCapacity: 10)
penHolder.add(pen: monamiPen)
penHolder.add(pen: sharpPen)
penHolder.printDescription()
