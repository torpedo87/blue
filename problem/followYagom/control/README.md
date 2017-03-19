```swift
//switch
let integerValue: Int = 5
switch integerValue {
case 0:
    print("value == zero")
case 1...10:
    print("value == 1~10")
    fallthrough   // 만약 이 case 실행하면 바로 다음 case도 참이 아니더라도 실행해
case Int.min..<0, 101..<Int.max:
    print("value < 0 or Value > 100")
    break
default:
    print("10< value <= 100")
}

//switch and tuple
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("min", 55)

switch tupleValue {
case ("min", 30):
    print("perfect")
case ("jun", _):
    print("only name ok")
case (let name, 55):
    print("only age ok, the name is \(name)")
default:
    print("who are looking for?")
}

//where (입력값 이외에 다른 타입의 조건들을 고려하고 싶을 때)
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true:
    print("인턴")
case "사원" where 연차 < 2 && 인턴인가 == false:
    print("신입사원")
case "사원" where 연차 > 5:
    print("오래된 사원")
case "사원":
    print("사원")
case "대리":
    print("대리")
default:
    print("사장이니?")
}

//열거형
enum School {
    case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = School.university

switch 최종학력 {
case .primary:
    print("유졸")
case .elementary:
    print("초졸")
case .middle:
    print("중졸")
case .high:
    print("고졸")
case .college:
    print("전문대졸")
case .university:
    print("대졸")
case .graduate:
    print("대학원졸")
}

//for
for i in 0...5 {
    if i % 2 == 0 {
        print(i)
        continue //다음 i로 넘어가기
    }
    print("\(i) == 홀수")
}


let helloSwift: String = "Hello Swift"
for char in helloSwift.characters {
    print(char)
}

//dictionary안의 원소들은 tuple형태이다
let friends: [String: Int] = ["jun":35, "min":55]
for tuple in friends {
    print(tuple)
}

for (키, 값) in friends {
    print("\(키) : \(값)")
}

//while
var names: [String] = ["jun", "jenny", "minha", "chicho", "favri"]

repeat {
    print("goodbye \(names.removeFirst())")
} while names.isEmpty == false

//중첩반복문 이름표
var numbers: [Int] = [3, 2342, 6, 3252]

numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }
    
    var count: Int = 0
    printLoop: while true {
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}

numbers
```