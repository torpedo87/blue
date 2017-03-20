//
//  ViewController.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 21..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var vendingMachine = VendingMachine()
    
    //콜라 사이다 재고수 값 들어가는 레이블
    @IBOutlet weak var cokeCount: UILabel!
    @IBOutlet weak var cidarCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //실행되자마자 콜라 사이다 재고수 표시해라
        drawView()
        
        //added 알람이 올때마다 drawview 메소드 호출??
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.drawView), name: NSNotification.Name("added"), object: nil)
    }

    // 창에 콜라 사이다 재고수 표시해주는 함수
    func drawView() {
        let stocks = vendingMachine.getStockDict()
        if let coke = stocks["cocacola"] {
            cokeCount.text = String(describing: coke)
        }
        if let cidar = stocks["cidar"] {
            cidarCount.text = String(describing: cidar)
        }
    }
    
    
    //이 함수들은 자판기 클래스 중복이 아닌가...??
    func getStocks() -> [String: Int] {
        return vendingMachine.getStockDict()
    }
    
    func setStocks(stocks: [String: Int]) {
        vendingMachine.setStock(stored: stocks)
    }
    
    //콜라 추가 버튼
    @IBAction func addCoke(_ sender: Any) {
        let coke = Soda(maker: "cocacola inc.", price: 1000, name: "cocacola", expireDate: Date(), caffein: false, acidLevel: 50)
        vendingMachine.add(beverage: coke)
    }
    
    //사이다 추가 버튼
    @IBAction func addCidar(_ sender: Any) {
        let cidar = Soda(maker: "lotte", price: 1000, name: "cidar", expireDate: Date(), caffein: false, acidLevel: 40)
        vendingMachine.add(beverage: cidar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
