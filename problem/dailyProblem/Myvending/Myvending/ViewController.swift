//
//  ViewController.swift
//  Myvending
//
//  Created by Jun woo Park on 2017. 3. 20..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let vendingMachine:VendingMachine = VendingMachine()
    
    let defaults = UserDefaults.standard
    defaults.set(_ value: stockDic, forKey: "stockDic")

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cocaCola = CafeDrink(withIsMilk: false)
        let caffeLatte = CafeDrink(withIsMilk: true)
        let soju = DecaDrink(withAlcohol: true)
        let sprite = DecaDrink(withAlcohol: false)
        
//        vendingMachine.add(drink: cocaCola)
//        vendingMachine.add(drink: caffeLatte)
//        vendingMachine.add(drink: soju)
//        vendingMachine.add(drink: sprite)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

