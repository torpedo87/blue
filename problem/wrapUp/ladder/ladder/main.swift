//
//  main.swift
//  ladder
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation


func makeLadder(width: Int, height: Int) -> [[Bool]] {
    //껍질 만들기
    
    var outterLadder = Array<Any>()
    
    //바깥 사다리는 height, 안쪽 사다리는 width
    for _ in 0..<height {
        var innerLadder = Array<Any>()
        for _ in 0..<width {
            innerLadder.append(arc4random_uniform(2) == 1)
        }
        outterLadder.append(innerLadder)
    }
    return outterLadder as! [[Bool]]
}
print(makeLadder(width: 3, height: 5))
let myLadder = makeLadder(width: 3, height: 5)

func printLadder(ladder: [[Bool]]) {
    
    for innerArr in ladder {
        print("|", terminator: "")
        for i in 0..<innerArr.count {
            innerArr[i] ? print("-", terminator: "|") : print(" ", terminator: "|")
        }
        print("")
    }
}

print(printLadder(ladder: myLadder))
