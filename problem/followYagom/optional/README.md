```swift
// optional은 열거형이다 case some, none
// optional 값 확인
let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("negative value is \(value)")
        
    case .some(let value) where value > 10:
        print("large value is \(value)")
        
    case .some(let value):
        print("value is \(value)")
        
    case .none:
        print("nil")
    }
}

// optional 타입이 아닌 변수에 optional 값을 넣어줄 때에는 ! 붙여야한다

// optional binding
var myName: String? = "jun"
if let name = myName {
    print("myName is \(name)")
} else {
    print("myName == nil")
}


```