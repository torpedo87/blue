//
//  drink.swift
//  vendingmachine
//
//  Created by Jun woo Park on 2017. 3. 16..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

public class Drink {
    fileprivate var brand: String
    fileprivate var capacity: Int
    fileprivate var price: Int
    fileprivate var name: String
    fileprivate var dueDate: Date
    fileprivate var isCafe: Bool
    
    init(withIsCafe: Bool) {
        isCafe = withIsCafe
        name = String()
        brand = String()
        capacity = Int()
        price = Int()
        dueDate = Date()
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(drinkName: String) {
        name = drinkName
    }
    
}

public class CafeDrink: Drink {
    var isMilk: Bool
    init(withIsMilk: Bool) {
        isMilk = withIsMilk
        super.init(withIsCafe: true)
    }
}

public class DecaDrink: Drink {
    var isAlcohol: Bool
    init(withAlcohol: Bool) {
        isAlcohol = withAlcohol
        super.init(withIsCafe: false)
    }
}


