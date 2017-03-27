//
//  ViewController.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 26..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vendingMachine = VendingMachine()
    let cocaCoke = CocaCoke()
    let cocaJiuice = CocaJiuice()
    let lotteCidar = LotteCidar()
    let lotteMilk = LotteMilk()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            vendingMachine.printDescription()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDrink(drinkName: Drink) {
        vendingMachine.add(drink: drinkName)
    }
    
    func vcSaveData() {
        vendingMachine.saveData()
    }
    
    func vcBringData() {
        vendingMachine.bringData()
    }
    @IBAction func AddButton(_ sender: Any) {
        vendingMachine.add(drink: cocaCoke)
        print(vendingMachine.getStockDic())
    }

}

