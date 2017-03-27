//
//  main.swift
//  extension
//
//  Created by Jun woo Park on 2017. 3. 27..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation


extension String {
    func filterHangulWord() -> [String] {
        var hangulArr = [String]()
        let tempArr = self.components(separatedBy: "-")
        var outterArr = [[String]]()
        for element in tempArr {
            var innerArr = [String]()
            for scalar in element.unicodeScalars {
                if scalar.value >= 44032 && scalar.value <= 55203 {
                    innerArr.append(scalar.description)
                }
            }
            if innerArr.count != 0 {
                outterArr.append(innerArr)
            }
        }
        //print(outterArr)
        var resultArr = [String]()
        for inner in outterArr {
            resultArr.append(inner.joined())
        }
        return resultArr
    }
}

let str = "http://www.osxdev.org/forum/index.php?threads/swift-2-0에서-try-catch로-fatal-error-잡을-수-있나요.382/"
//print(str.components(separatedBy: "-"))


//print("가".unicodeScalars.first)
//print("힣".unicodeScalars.first)
//print("에서도".components(separatedBy: ""))
print(str.filterHangulWord())
