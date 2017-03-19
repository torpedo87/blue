//
//  CXMonamiPen.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 19..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class CXMonamiPen: CXPen {
    //모나미 클래스의 새로운 속성
    private var modelName = String()
    
    init(withModel: String) {
        modelName = withModel
        super.init(withBrand: "Monami")
    }
    
    //편하게 model 값을 지정해줌
    convenience init() {
        self.init(withModel: "modelName111")
    }
    
    //setter getter 대신에 연산프로퍼티 사용하셨군!
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

class CXRedPen: CXMonamiPen {
    //펜의 공통속성 중 색깔의 값을 오버라이드
    override init(withModel: String) {
        super.init(withModel: withModel)
        self.colorName = "RED"
    }
}

class CXBluePen: CXMonamiPen {
    override init(withModel: String) {
        super.init(withModel: withModel)
        self.colorName = "BLUE"
    }
}
class CXBlackPen: CXMonamiPen {
    override init(withModel: String) {
        super.init(withModel: withModel)
        self.colorName = "BLACK"
    }
}
