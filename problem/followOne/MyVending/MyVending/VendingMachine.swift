//
//  VendingMachine.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 21..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation



class VendingMachine {
    
    //자판기 내의 재고배열 딕셔너리
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
        
        //add 호출되면 센터에 알려라??(view controller가 관심있어하는 메소드)
        NotificationCenter.default.post(name: Notification.Name("added"), object: nil)
    }
    
    //재고수 사전(이렇게 바꿔줘야 userdefault에 넣을 수 있다)
    func getStockDict() -> [String:Int] {
        var tempDict = [String:Int]()
        for (key, value) in stocks {
            tempDict[key] = value.count
        }
        return tempDict
    }
    
    
    //재고수사전 -> 재고배열사전
    func changeStock(stored: [String:Int]) {
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

    func getStocks() -> [String:[Beverage]] {
        return stocks
    }
    
    func setStocks(unarch: [String:[Beverage]]) {
        stocks = unarch
    }
}
