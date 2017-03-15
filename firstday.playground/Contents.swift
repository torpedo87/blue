//: Playground - noun: a place where people can play

import UIKit

public func makeLadder(row : Int, col : Int) -> [[Bool]] {
    var outterArray : Array<Array<Bool>> = [[Bool]]()
    
    for _ in 1...row {
        var innerArray : Array<Bool> = [Bool]()
        for _ in 1...col {
            let isLadder = Int(arc4random()%2)==1
            innerArray.append(isLadder)
        }
        outterArray.append(innerArray)
    }
    return outterArray
}

public func printLadder(data : [[Bool]]) {
    for innerArray in data {
        print("|", separator: "", terminator: "")
        for isLadder in innerArray {
            if (isLadder) {
                print("-", separator: "", terminator: "|")
            }
            else {
                print(" ", separator: "", terminator: "|")
            }
        }
        print()
    }
}

print(makeLadder(row : 3, col : 5))
var ladder = makeLadder(row : 3, col : 5)
printLadder(data : ladder)