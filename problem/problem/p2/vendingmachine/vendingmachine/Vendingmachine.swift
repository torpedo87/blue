//
//  vendingmachine.swift
//  vendingmachine
//
//  Created by Jun woo Park on 2017. 3. 16..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class VendingMachine {
    //typealias StringIntDictionary = [String: Int]
    private var drinks: [Drink]
    
    init(){
        drinks = [Drink]()
    }
    
    //add stock in array
    func add(drink: Drink) {
        drinks.append(drink)
    }
    
    //get stock with stockname
    func getAllStockNames() -> [String] {
        var tempSet: Set<String> = Set<String>()
        for item in drinks {
            tempSet.insert(item.getName())
        }
        return Array(tempSet)
    }
    
    //get stock number
    func getTotalStockNumber() -> [String:Int] {
        var AllStockNamesArr: Array = getAllStockNames()
        var stockDic:[String:Int] = [:]
        for name in AllStockNamesArr {
            var filteredArr = drinks.filter{ $0.getName() == name }
            stockDic[name] = filteredArr.count
        }
        return stockDic
    }
    
    //input coin: Int,    return [availableName: String]
    func getAvailablelist(coin: Int) -> [String] {
        
    }
    
    
}
