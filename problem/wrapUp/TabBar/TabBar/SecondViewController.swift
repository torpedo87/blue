//
//  SecondViewController.swift
//  TabBar
//
//  Created by Jun woo Park on 2017. 3. 26..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var startY: Double = Double()
    var initAlpha: Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let startPoint = touches.first?.location(in: self.view)
        startY = Double((startPoint?.y)!)
        //print(startPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let currentY = touches.first?.location(in: self.view).y
        let diffY = abs(Int(currentY!) - Int(startY))
        if diffY % 5 == 0 {
            initAlpha -= 0.05
        }
        self.view.backgroundColor = UIColor.blue.withAlphaComponent(CGFloat(initAlpha))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        initAlpha = 1
        self.view.backgroundColor = UIColor.blue.withAlphaComponent(CGFloat(initAlpha))

    }


}

