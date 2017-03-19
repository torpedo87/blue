//
//  mycalender.swift
//  mycalender
//
//  Created by Jun woo Park on 2017. 3. 16..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class MyCalender {
    
    //today()  Int(year, month, date, hour, minute, second)
    func getToday() -> (Int, Int, Int, Int, Int, Int) {
        let date1 = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = dateFormatter.string(from: date1 as Date)
        let dateArr = dateStr.components(separatedBy: " ")
        let ymdStr = dateArr[0]
        let ymdArr = ymdStr.components(separatedBy: "-")
        let ymdIntArr = ymdArr.map { Int($0)! }
        let hmsStr = dateArr[1]
        let hmsArr = hmsStr.components(separatedBy: ":")
        let hmsIntArr = hmsArr.map { Int($0)! }
        
        return (ymdIntArr[0], ymdIntArr[1], ymdIntArr[2], hmsIntArr[0], hmsIntArr[1], hmsIntArr[2])
    }
    
    
    // string year, month, date -> Date()
    func getDateInstance(ymd: String) -> {} {
    
    }
    
    // Int year, month, date -> Date()
    
    
    // today Date() -> korean string
    
    
    // year, month -> day of 1st date
    
    
    // year, month -> [[date]/week]
    
    
}
