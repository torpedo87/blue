//
//  ViewController.swift
//  MoneyConverter
//
//  Created by Jun woo Park on 2017. 3. 22..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyField: UITextField!
    
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //사용자의 액션을 받는 버튼
    @IBAction func convertMoney(_ sender: Any) {
        
        //사용자가 선택하는 환율 가져오기
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else {
            print("sourceCurrency error")
            return
        }
        
        //사용자가 입력하는 돈의 양 가져오기
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "error"
            return
        }
        
        //사용자가 입력한 환율과 돈의 양으로 돈 인스턴스 생성
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
        //메소드를 사용해서 환전 결과 출력
        var targetMoneyString = ""
        for i in 0..<4 {
            targetMoneyString += sourceMoney.valueInCurrency(currency: Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyString
        
    }

}

