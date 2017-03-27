//
//  main.swift
//  Vending
//
//  Created by Jun woo Park on 2017. 3. 26..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

//print("Hello, World!")

let vendingMachine = VendingMachine()
let cocaCoke = CocaCoke()
let cocaJiuice = CocaJiuice()
let lotteCidar = LotteCidar()
let lotteMilk = LotteMilk()

vendingMachine.add(drink: cocaCoke)
vendingMachine.add(drink: cocaCoke)
vendingMachine.add(drink: cocaJiuice)
vendingMachine.add(drink: cocaJiuice)
vendingMachine.add(drink: cocaJiuice)
vendingMachine.add(drink: lotteMilk)
vendingMachine.add(drink: lotteCidar)

vendingMachine.inputCoinGetAvailableList(money: 2000)
print(vendingMachine.buyGetBalance(name: "CocaCoke"))

vendingMachine.printDescription()
