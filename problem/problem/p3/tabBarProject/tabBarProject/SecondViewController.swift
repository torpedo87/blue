//
//  SecondViewController.swift
//  tabBarProject
//
//  Created by Jun woo Park on 2017. 3. 17..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var startPoint:Double = Double()
    var currentPoint:Double = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.brown
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            startPoint = Double(touch.location(in: self.view).y)
        }
        print(startPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            currentPoint = Double(touch.location(in: self.view).y)
            var diff = Int(abs(currentPoint - startPoint))
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }


}

