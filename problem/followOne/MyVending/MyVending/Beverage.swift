//
//  Beverage.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 21..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

//customstringconvertible???
class Beverage : NSObject, NSCoding {
    fileprivate let maker: String
    fileprivate let price: Int
    fileprivate let name: String
    fileprivate let expireDate: Date
    
    init(maker: String, price: Int, name: String, expireDate: Date) {
        self.maker = maker
        self.price = price
        self.name = name
        self.expireDate = expireDate
    }
    
    override convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()))
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    override var description: String {
        return self.name
    }

    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return (lhs.getName() == rhs.getName()) && (lhs.getPrice() == rhs.getPrice())
    }
    
    //압축할 때 이렇게 해라
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(maker, forKey: "maker")
        aCoder.encode(expireDate, forKey: "expireDate")
    }
    
    //압축풀기때 이렇게 해라, nscoding protocol 에서 요구하는 init 함수를 클래스에서 구현할 때 required 붙는다
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        price = aDecoder.decodeInteger(forKey: "price")
        maker = aDecoder.decodeObject(forKey: "maker") as! String
        expireDate = aDecoder.decodeObject(forKey: "expireDate") as! Date
    }

}


class CoolBeverage: Beverage {
    fileprivate var caffein: Bool
    fileprivate var acidLevel: Int
    
    init(maker: String, price: Int, name: String, expireDate: Date, caffein: Bool, acidLevel: Int) {
        self.caffein = caffein
        self.acidLevel = acidLevel
        super.init(maker: maker, price: price, name: name, expireDate: expireDate)
    }
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), caffein: Bool(), acidLevel: Int())
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(caffein, forKey: "caffein")
        aCoder.encode(acidLevel, forKey: "acidLevel")
    }
    
    required init?(coder aDecoder: NSCoder) {
        caffein = aDecoder.decodeBool(forKey: "caffein")
        acidLevel = aDecoder.decodeInteger(forKey: "acidLevel")
        super.init(coder: aDecoder)
    }

}


class HotBeverage: Beverage {
    fileprivate var temperature: Int
    
    init(maker: String, price: Int, name: String, expireDate: Date, temperature: Int) {
        self.temperature = temperature
        super.init(maker: maker, price: price, name: name, expireDate: expireDate)
    }
    
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), temperature: Int())
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(temperature, forKey: "temperature")
    }
    
    required init?(coder aDecoder: NSCoder) {
        temperature = aDecoder.decodeInteger(forKey: "temperature")
        super.init(coder: aDecoder)
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
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(taste, forKey: "taste")
    }
    
    required init?(coder aDecoder: NSCoder) {
        taste = aDecoder.decodeObject(forKey: "taste") as! String
        super.init(coder: aDecoder)
    }

}
