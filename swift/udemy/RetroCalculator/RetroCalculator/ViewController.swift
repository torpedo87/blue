//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Jun woo Park on 2017. 4. 11..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

//소리
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    @IBAction func onDividePressed(_ sender: Any) {
        processOperation(operation: Operation.Divide)
    }
    
    
    @IBAction func onMultiplyPressed(_ sender: Any) {
        processOperation(operation: Operation.Multiply)
    }
    
    
    @IBAction func onSubtractPressed(_ sender: Any) {
        processOperation(operation: Operation.Subtract)
    }
    
    
    @IBAction func onAddPressed(_ sender: Any) {
        processOperation(operation: Operation.Add)
    }
    
    
    @IBAction func onEqualPressed(_ sender: Any) {
        processOperation(operation: currentOperation)
    }
    
    enum Operation: String {
        case Divide = "/"
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Empty = "Empty"
    }
    
    var btnSound: AVAudioPlayer!
    var runningNumber: String = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOperation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //사운드파일 경로
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        outputLbl.text = "0"
    }

    
    @IBAction func numberPressed(_ sender: UIButton) {
        //playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
        
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            //숫자 입력 없이 연산자 눌렀을 때
            if runningNumber != "" {
                //누르는 수가 오른쪽수
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)!+Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)!/Double(rightValStr)!)"
                } else if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)!*Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)!-Double(rightValStr)!)"
                }
                //결과값이 왼쪽수가 된다
                leftValStr = result
                outputLbl.text = result
            }
            currentOperation = operation
            
        } else {
            //숫자가 이미 들어가있는 상태에서 연산자 누를 때
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}

