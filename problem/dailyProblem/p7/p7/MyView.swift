//
//  MyView.swift
//  p7
//
//  Created by Jun woo Park on 2017. 3. 22..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colorsSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [UIColor.blue.cgColor, UIColor.red.cgColor] as CFArray
        let startPoint: CGPoint = CGPoint(x: 187.5, y: 0.0)
        let endPoint: CGPoint = CGPoint(x: 187.5, y: 667)
        let locations: UnsafePointer<CGFloat>? = nil
        let gradient: CGGradient = CGGradient(colorsSpace: colorsSpace, colors: colors, locations: locations)!
        context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        var path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        
        //design path in layer
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치 땔때마다 다시 draw한다
        self.setNeedsDisplay()
    }
    
    
    
}
