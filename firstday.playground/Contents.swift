//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func makeLadder(x : Int, y : Int) -> [[Int]] {
    var outArr = [[Int]]()
    for _ in 0..<y {
        var innerArr = [Int]()
        for _ in 0..<x {
            innerArr.append(Int(arc4random_uniform(3)))
        }
        outArr.append(innerArr)
    }
    return outArr
}
print(makeLadder(x : 3, y : 5))


func drawLadder(ladder : [[Int]]) {
    for innerArr in ladder {
        print("|", terminator : "")
        for index in 0..<innerArr.count {
            if (innerArr[index] == 0) {
                print("-", terminator: "|")
            } else if(innerArr[index] == 1) {
                print(" ", terminator: "|")
            } else if(innerArr[index] == 2) {
                print("/", terminator: "|")
            } else {
                print("\\", terminator: "|")
            }
        }
        print()
    }
}

var ladder = makeLadder(x : 3, y : 5)


drawLadder(ladder : ladder)