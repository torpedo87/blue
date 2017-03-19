//
//  CXSharpPen.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 19..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class CXSharpPen: CXPen {
    //sharp의 새로운 속성
    fileprivate var modelName = String()
    
    init(withModel: String) {
        modelName = withModel
        super.init(withBrand: "Sharp")
    }
    
    //편의로 미리 모델이름 넣어주기
    convenience init() {
        self.init(withModel: "modelName000")
    }
    
    //getter setter대신에 연산 프로퍼티
    var model: String {
        get {
            return modelName
        }
        set(name) {
            self.modelName = name
        }
    }
    
    
    override func printDescription() {
        print("Brand: \(self.brandName), Color: \(self.colorName), Usage: \(self.usagePercent), Model : \(modelName)")
    }
}
