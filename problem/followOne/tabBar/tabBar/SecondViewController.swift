//
//  SecondViewController.swift
//  tabBar
//
//  Created by Jun woo Park on 2017. 3. 19..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //첫터치좌표의 y값, 배경투명도 수치
    var startLocation: Double = Double()
    var initAlpha: Double = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //배경색 지정해주기
        self.view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //inner 매개변수명을 넣어준 거구나
        super.touchesBegan(touches, with: event)
        
        //터치시작, touches가 옵셔널이라 그런가봐(first는 왜 넣어주는거지). 그리고 시작점의 y값 받아오기
        if let touch = touches.first {
            startLocation = Double(touch.location(in: self.view).y)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        //터치중, 움직일때 y값 차이 계산해서 투명도 변경
        if let touch = touches.first {
            let currentY: Double = Double(touch.location(in: self.view).y)
            
            let diff: Int = Int(abs(startLocation - currentY))
            
            if diff % 5 == 0 {
                initAlpha -= 0.05
                self.view.backgroundColor = UIColor.yellow.withAlphaComponent(CGFloat(initAlpha))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        // 터치 끝나면 다시 투명도 1
        self.view.backgroundColor = UIColor.yellow.withAlphaComponent(CGFloat(1))
        initAlpha = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

