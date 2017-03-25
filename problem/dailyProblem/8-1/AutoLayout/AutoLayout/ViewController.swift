//
//  ViewController.swift
//  AutoLayout
//
//  Created by Jun woo Park on 2017. 3. 24..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var splitView: UIView!
    
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.temp))
        self.splitView.addGestureRecognizer(myPanGestureRecognizer)
    }
    
    func temp(reg: UIPanGestureRecognizer) {
        topViewHeight.constant = reg.location(in: self.view).y
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

