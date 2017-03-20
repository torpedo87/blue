//
//  VendingMachine.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 21..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class VendingMachine {
    
    //nsuserdefault 자체가 글로벌 디셔너리니까 굳이 이렇게 따로 딕셔너리 안만들어도 되지 않을까?
    private var stocks: [String:[Beverage]]
    
    init() {
        stocks = [String:[Beverage]]()
    }
    
    func add(beverage: Beverage) {
        if let number = stocks[beverage.getName()] {
            //재고 있으면 딕셔너리 값의 배열에 넣어라
            if number.count > 0 {
                stocks[beverage.getName()]!.append(beverage)
            }
            
            //재고가 없으면 배열을 새로 만들어서 넣어줘라
        } else {
            var temp = [Beverage]()
            temp.append(beverage)
            stocks[beverage.getName()] = temp
        }
        
        //add 호출되면 센터에 알려라??
        NotificationCenter.default.post(name: Notification.Name("added"), object: nil)
    }
    
    //재고수 파악하기
    func getStockDict() -> [String:Int] {
        var tempDict = [String:Int]()
        for (key, value) in stocks {
            tempDict[key] = value.count
        }
        return tempDict
    }
    
    
    //재고배열로 넣기
    func setStock(stored: [String:Int]) {
        var temp = [String:[Beverage]]()
        for (key, value) in stored {
            var tempArray = [Beverage]()
            for _ in 1...value {
                let soda = Soda(name: key)
                tempArray.append(soda)
            }
            temp[key] = tempArray
        }
        stocks = temp
    }
    
    func printStocks() {
        print("stocks", stocks)
    }
}
