//
//  ViewController.swift
//  MiraclePill
//
//  Created by Jun woo Park on 2017. 4. 2..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit
//프로토콜 추가
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var statePickerBtn: UIButton!
    
    let states = ["Alaska", "Alakansas", "Alabama", "California", "New York", "Miami"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //이건 뭐지
        statePicker.dataSource = self
        statePicker.delegate = self
        //self.view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //버튼 누르면 피커 보여주기
    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
    }
    
    //섹션
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    //피커 선택시 버튼에 표시되고 피커 숨기기
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState()) //UIControlState.normal
        statePicker.isHidden = true
    }

}

