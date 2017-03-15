//
//  pen.swift
//  pen
//
//  Created by Jun woo Park on 2017. 3. 15..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

//customstringconvertible 인터페이스 상속(밑에 var description이랑 쌍) computed property
class CXPen : CustomStringConvertible {
    fileprivate var brand : String
    fileprivate var color : String
    fileprivate var usage : Int
    
    init(withBrand : String) {
        brand = withBrand
        color = String()
        usage = Int()
    }
    
    //getter
    func getBrand() -> String {
        return brand
    }
    
    func getColor() -> String {
        return color
    }
    func getUsage() -> Int {
        return usage
    }
    
    //setter
    func setBrand(_ name: String) {
        brand = name
    }
    func setColor(_ name: String) {
        color = name
    }
    func setUsage(_ name: Int) {
        usage = name
    }
    
    func printDescription(){
        print("brand is \(brand), color is \(color), usage is \(usage)")
    }
    
    //pens 배열 내부 구체적으로 보이도록
    var description: String {
        return "CXPen description : brand=\(brand)"
    }
}


class CXMonamiPen : CXPen {
    fileprivate var model : String
    
    init(withModel : String) {
        // 자신의 변수를 초기화한 이후에 상속 초기화 가능
        model = withModel
        super.init(withBrand: "monami")
    }
    func getModel() -> String {
        return model
    }
    
    func setModel(_ name : String) {
        model = name
    }

    override func printDescription() {
        print("model is \(model), brand is \(brand), color is \(color), usage is \(usage)")
    }
}


class CXSharpPen : CXPen {
    init() {
        super.init(withBrand: "sharp")    }
}

class CXRedPen : CXMonamiPen {
    init(model: String) {
        super.init(withModel: model)
        color = "red"
    }
    
    
}

class CXBluePen : CXMonamiPen {
    init(model: String) {
        super.init(withModel: model)
        color = "red"
    }
    
}

class CXBlackPen : CXMonamiPen {
    init(model: String) {
        super.init(withModel: model)
        color = "red"
    }
    
    
}
