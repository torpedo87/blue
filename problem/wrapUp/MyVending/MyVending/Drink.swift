//
//  Drink.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 26..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class Drink {
    var brand: String
    var capacity: Int
    var price: Int
    var name: String
    var dueDate: Date
    
    init (withBrand: String) {
        brand = withBrand
        capacity = Int()
        price = Int()
        name = String()
        dueDate = Date()
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Int {
        return self.price
    }
}

class CocaCola: Drink {
    var isCaffein: Bool
    init(withCaffein: Bool) {
        isCaffein = withCaffein
        super.init(withBrand: "CocaCola")
    }
}

class Lotte: Drink {
    var isCarbonate: Bool
    init(withCarbonate: Bool) {
        isCarbonate = withCarbonate
        super.init(withBrand: "Lotte")
    }
}

class CocaCoke: CocaCola {
    init() {
        super.init(withCaffein: true)
        capacity = 100
        price = 500
        name = "CocaCoke"
    }
}

class CocaJiuice: CocaCola {
    init() {
        super.init(withCaffein: false)
        capacity = 100
        price = 500
        name = "CocaJiuice"
    }
}

class LotteCidar: Lotte {
    init() {
        super.init(withCarbonate: true)
        capacity = 100
        price = 500
        name = "LotteCidar"
    }
}

class LotteMilk: Lotte {
    init() {
        super.init(withCarbonate: false)
        capacity = 150
        price = 700
        name = "LotteMilk"
    }
}
