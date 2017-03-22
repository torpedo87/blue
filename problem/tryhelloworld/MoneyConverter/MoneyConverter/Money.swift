//
//  Money.swift
//  MoneyConverter
//
//  Created by Jun woo Park on 2017. 3. 22..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

struct Money {
    var usdollar = 0.0
    
    //달러값 갖고 초기화
    init(_ _usdollar: Double) {
        usdollar = _usdollar
    }
    
    //돈과 환율로 초기화
    init(_ amount: Double, currency: Currency) {
        usdollar = amount / currency.ratio
    }
    
    //환전 메소드
    func valueInCurrency (currency:Currency) -> String {
        return "\(currency.symbol)" + "\(usdollar * currency.ratio)"
    }
}

enum Currency: Int {
    case USD = 0, KRW, JPY, EUR
    var ratio: Double {
        get {
            switch self {
            case .USD: return 1.0
            case .KRW: return 1178.5
            case .JPY: return 122.45
            case .EUR: return 0.92
            }
        }
    }
    
    var symbol: String {
        get {
            switch self {
            case .USD: return "달러"
            case .KRW: return "원"
            case .JPY: return "엔"
            case .EUR: return "유로"
            }
        }
    }
    
}

let myMoney: Money = Money(120)
let incomeInKRW = Money(350_000, currency: .KRW)


