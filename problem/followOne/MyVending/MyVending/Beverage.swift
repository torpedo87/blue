//
//  Beverage.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 21..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

//customstringconvertible???
class Beverage :CustomStringConvertible {
    private let maker: String
    private let price: Int
    private let name: String
    private let expireDate: Date
    
    init(maker: String, price: Int, name: String, expireDate: Date) {
        self.maker = maker
        self.price = price
        self.name = name
        self.expireDate = expireDate
    }
    
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()))
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    var description: String {
        return self.name
    }
}



class CoolBeverage: Beverage {
    private var caffein: Bool
    private var acidLevel: Int
    
    init(maker: String, price: Int, name: String, expireDate: Date, caffein: Bool, acidLevel: Int) {
        self.caffein = caffein
        self.acidLevel = acidLevel
        super.init(maker: maker, price: price, name: name, expireDate: expireDate)
    }
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), caffein: Bool(), acidLevel: Int())
    }
}



class HotBeverage: Beverage {
    private var temperature: Int
    
    init(maker: String, price: Int, name: String, expireDate: Date, temperature: Int) {
        self.temperature = temperature
        super.init(maker: maker, price: price, name: name, expireDate: expireDate)
    }
    
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), temperature: Int())
    }
}


class Soda: CoolBeverage {
    private var taste: String
    override init(maker: String, price: Int, name: String, expireDate: Date, caffein: Bool, acidLevel: Int) {
        self.taste = String()
        super.init(maker: maker, price: price, name: name, expireDate: expireDate, caffein: caffein, acidLevel: acidLevel)
    }
    
    
    //왜 사용자편의 이니셜라이져를 두개나 만들었지??
    convenience init(taste: String) {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), caffein: Bool(), acidLevel: Int())
        self.taste = taste
    }
    convenience init(name: String) {
        self.init(maker: "soda inc.", price: 1000, name: name, expireDate: Date(timeInterval: 30000, since: Date()), caffein: true, acidLevel: 100 )
    }
}
