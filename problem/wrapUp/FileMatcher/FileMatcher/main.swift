//
//  main.swift
//  FileMatcher
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

var fileMatcher1 = FileMatcher()
fileMatcher1.allFiles(path: "/Users/junwoopark/dev/problem")
//print(fileMatcher1.allFiles(path: "/Users/junwoopark/dev/problem"))
//print(fileMatcher1.isExist(filename: "followOne", atPath: "/Users/junwoopark/dev/problem"))
print(fileMatcher1.sortFile(atPath: "/Users/junwoopark/dev/problem/dailyProblem"))
