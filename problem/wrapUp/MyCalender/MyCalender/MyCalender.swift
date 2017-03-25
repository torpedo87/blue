//
//  MyCalender.swift
//  MyCalender
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class MyCalender {
    var myCalender = Calendar.current   //그레고리안 달력
    var myDate = Date() //현재 날짜
    var myDateFormatter = DateFormatter()
    var myDateComponents = DateComponents()    //내가 원하는 날짜 지정해서 캘린더에 넣어라
    
    func getToday() -> (year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        var myTime = (year: 0 , month: 0, day: 0, hour: 0, minute: 0, second: 0)
        
        myTime.year = myCalender.component(.year, from: myDate)
        myTime.month = myCalender.component(.month, from: myDate)
        myTime.day = myCalender.component(.day, from: myDate)
        myTime.hour = myCalender.component(.hour, from: myDate)
        myTime.minute = myCalender.component(.minute, from: myDate)
        myTime.second = myCalender.component(.second, from: myDate)
        
        //print(myCalender)
        return myTime
    }
    
    func getIntDate(year: Int, month: Int, day: Int) -> Date {
        myDateComponents.year = year
        myDateComponents.month = month
        myDateComponents.day = day
        
        return myCalender.date(from: myDateComponents)!
    }
    
    func getStrDate(year: String, month: String, day: String) -> Date {
        myDateComponents.year = Int(year)
        myDateComponents.month = Int(month)
        myDateComponents.day = Int(day)
        return myCalender.date(from: myDateComponents)!
    }
    
    func getKoreanStr(todayDate: Date) -> String {
        myDateFormatter.dateFormat = "yyyy년 MM월 dd일 EEEE"
        return myDateFormatter.string(from: todayDate)
    }
    
    //해당 월의 1일의 요일
    func getFirstWeekday(year: Int, month: Int) -> String {
        myDateComponents.year = year
        myDateComponents.month = month
        myDateComponents.day = 1
        let thatDate = myCalender.date(from: myDateComponents)
        myDateFormatter.dateFormat = "EEEE"
        return myDateFormatter.string(from: thatDate!)
    }
    
    //해당날짜의 요일구하기
    func getWeekday(year: Int, month: Int, day: Int) -> String {
        myDateComponents.year = year
        myDateComponents.month = month
        myDateComponents.day = day
        let thatDate = myCalender.date(from: myDateComponents)
        myDateFormatter.dateFormat = "EEEE"
        return myDateFormatter.string(from: thatDate!)
    }
    
    //해당 월의 마지막날짜
    func getLastday(year: Int, month: Int) -> Int {
        myDateComponents.year = year
        myDateComponents.month = month + 1
        myDateComponents.day = 0
        let thatDate = myCalender.date(from: myDateComponents)
        myDateFormatter.dateFormat = "dd"
        return Int(myDateFormatter.string(from: thatDate!))!
    }

    
    func getMonthArr(year: Int, month: Int) -> [[Int]] {
        let lastDay = getLastday(year: year, month: month)
        //print(lastDay)
        //let firstWeekday = getFirstWeekday(year: year, month: month)
        var monthArr = [[Int]]()
        var weekArr = [Int]()
        for i in 1...lastDay {
            if getWeekday(year: year, month: month, day: i) != "일요일" {
                weekArr.append(i)
            } else {
                monthArr.append(weekArr)
                weekArr = [Int]()
                weekArr.append(i)
            }
        }
        if getWeekday(year: year, month: month, day: lastDay) != "일요일" {
            monthArr.append(weekArr)
        }
        
        return monthArr
    }
    
}

