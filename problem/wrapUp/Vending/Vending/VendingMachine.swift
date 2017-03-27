//
//  VendingMachine.swift
//  Vending
//
//  Created by Jun woo Park on 2017. 3. 26..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class VendingMachine {
    var stockArr: [Drink]
    var balance: Int
    var stockDic: [String:[Drink]]
    var logArr: [[String:Int]]
    
    init () {
        stockArr = [Drink]()
        balance = Int()
        stockDic = [String:[Drink]]()
        logArr = [[String:Int]]()
    }
    
    func add(drink: Drink) {
        //stockArr에 넣기
        stockArr.append(drink)
        
        //유통기한 설정
        let today = Date()
        let expireDate = today.addingTimeInterval(60*60*24*3)
        drink.dueDate = expireDate
        
        //stockDic에 넣기
        for drinkName in stockDic.keys {
            if drinkName == drink.getName() {
                stockDic[drinkName]?.append(drink)
                return
            }
        }
        stockDic[drink.getName()] = [drink]
    }
    
    
    func arrToDic() {
        
    }
    
    func getStockDic() -> [String:Int] {
        var newDic = [String:Int]()
        for drinkName in stockDic.keys {
            newDic[drinkName] = stockDic[drinkName]?.count
        }
        return newDic
    }
    
    func inputCoinGetAvailableList(money: Int) -> [String] {
        balance += money
        var availableArr = [String]()
        var stockNumDic = self.getStockDic()
        for drinkName in stockNumDic.keys {
            if stockNumDic[drinkName]! > 0 && (stockDic[drinkName]?[0].getPrice())! <= balance {
                availableArr.append(drinkName)
            }
        }
        return availableArr
    }
    
    func getAvailableList() -> [String] {
        var availableArr = [String]()
        var stockNumDic = self.getStockDic()
        for drinkName in stockNumDic.keys {
            if stockNumDic[drinkName]! > 0 && (stockDic[drinkName]?[0].getPrice())! <= balance {
                availableArr.append(drinkName)
            }
        }
        return availableArr
    }
    
    
    func buy(drinkName: String) {
        //재고 있는지 체크
        let availableArr = self.getAvailableList()
        print(availableArr)
        var count = Int()
        for name in availableArr {
            if name == drinkName {
                count += 1
            }
        }
        if count == 0 {
            print("재고가 없습니다")
            return
        }
        
        //잔액 체크
        let drinkPrice = stockDic[drinkName]?[0].getPrice()
        if balance < drinkPrice! {
            print("잔액부족")
            return
        }
        
        //잔액 감소
        balance -= drinkPrice!
        
        //배열 감소
        for index in 0..<stockArr.count {
            if stockArr[index].getName() == drinkName {
                stockArr.remove(at: index)
                break
            }
        }
        
        //사전 감소
        for name in stockDic.keys {
            if name == drinkName {
                stockDic[name]?.remove(at: 0)
            }
        }
        
        //로그에 넣기
        var tempDic = [String:Int]()
        tempDic[drinkName] = drinkPrice
        logArr.append(tempDic)
    }
    
    func buyGetBalance(name: String) -> Int {
        self.buy(drinkName: name)
        return balance
    }
    
    func getLog() -> [[String:Int]] {
        return logArr
    }
    
    func printDescription()  {
        print("stockArr : \(stockArr), stockDic: \(stockDic), balance: \(balance)")
    }
}
