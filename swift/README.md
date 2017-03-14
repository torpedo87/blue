# 다른 언어와의 차이점 이해하기
- xcode 설치하기
- playground
- 컴파일러(번역기
- interpreter(즉시실행, REPL) vs compiler(번역))
- print()해야 밑에 콘솔에 찍힌다

## 함수
- 기능적 단위
- print(value; seperater; terminater)

## data type
- 데이터타입이 메모리를 결정
- MemoryLayout<Int>.size //8byte  ==64bit
- let vs var(scope 의 차이)
- floating point error(실수 사용시 정밀도가 높은 경우 오류 발생, 소수점자릿수 확인 중요)

## 묶음(collection)
- 배열
- 사전(js object) - 키값으로 접근
- 집합 - 중복불가
- tuple - 소괄호, 같은 의미의 데이터를 묶어놓기, 쌍인 값
- enum(열거형) - 제한된 case 선택지

## optional(undefined)
- forced unwrapping(?->!)
- ! 안쓰려고 optional binding(if let)

## 삼항연산자
- if 문의 간략형태
- nil 병합연산자(if let)

## 흐름제어
- switch (break 없어도 다음 case로), tuple 비교도 가능(두 변수)
- for문의 stride (downside로 반복 돌리고 싶을때)
- for name in names
- name 안쓰고 반복수만 따지는 것이면 언더바 사용
- for index in 0..<names.count

### 에러처리(throw)
- do{ try } catch
- return 값이 ? -> try?, try!

```swift
public func makeLadder(row : Int, col : Int) -> [[Bool]] {
    var outterArray : Array<Array<Bool>> = [[Bool]]()
    
    for _ in 1...row {
        var innerArray : Array<Bool> = [Bool]()
        for _ in 1...col {
            let isLadder = Int(arc4random()%2)==1
            innerArray.append(isLadder)
        }
        outterArray.append(innerArray)
    }
    return outterArray
}

public func printLadder(data : [[Bool]]) {
    for innerArray in data {
        print("|", separator: "", terminator: "")
        for isLadder in innerArray {
            if (isLadder) {
                print("-", separator: "", terminator: "|")
            }
            else {
                print(" ", separator: "", terminator: "|")
            }
        }
        print()
    }
}

print(makeLadder(row : 3, col : 5))
var ladder = makeLadder(row : 3, col : 5)
printLadder(data : ladder)
```
```swift
func makeLadder(x : Int, y : Int) -> [[Bool]] {
    var outArr = [[Bool]]()
    for _ in 0..<y {
        var innerArr = [Bool]()
        for _ in 0..<x {
            innerArr.append(arc4random_uniform(2) == 0)
        }
        outArr.append(innerArr)
    }
    return outArr
}
print(makeLadder(x : 3, y : 5))


func drawLadder(ladder : [[Bool]]) {
    for innerArr in ladder {
        print("|", terminator : "")
        for index in 0..<innerArr.count {
            if (innerArr[index] == true) {
                print("-", terminator: "|")
            } else {
                print(" ", terminator: "|")
            }
        }
        print()
    }
}

var ladder = makeLadder(x : 3, y : 5)


drawLadder(ladder : ladder)
```
```swift
func makeLadder(x : Int, y : Int) -> [[Int]] {
    var outArr = [[Int]]()
    for _ in 0..<y {
        var innerArr = [Int]()
        for _ in 0..<x {
            innerArr.append(Int(arc4random_uniform(3)))
        }
        outArr.append(innerArr)
    }
    return outArr
}
print(makeLadder(x : 3, y : 5))


func drawLadder(ladder : [[Int]]) {
    for innerArr in ladder {
        print("|", terminator : "")
        for index in 0..<innerArr.count {
            if (innerArr[index] == 0) {
                print("-", terminator: "|")
            } else if(innerArr[index] == 1) {
                print(" ", terminator: "|")
            } else if(innerArr[index] == 2) {
                print("/", terminator: "|")
            } else {
                print("\\", terminator: "|")
            }
        }
        print()
    }
}

var ladder = makeLadder(x : 3, y : 5)


drawLadder(ladder : ladder)
```
---

# closure(함수의 개념, 닫혀있다)
- { in }
- 클로저를 인자값으로 받는 api 많아지는 추세
- 함수를 데이터 타입으로 사용
- [value] 캡쳐기능, 클로저 안에서 let value 처럼 된다
- 클로저가 언제 호출될지 모르기 때문에 변수의 불확실성을 방지
- 애니메이션 인자값에 사용됨
- 누적함수 increment(재호출시 이전 클로저는 이전 값을 유지)

# 고차함수 (함수를 인자값 또는 리턴값으로 사용하는 함수)
- map (for)
- filter (for if)
- reduce (for, n-1 차원으로 만든다)
## optional
- map (for)
- flatMap (for, nil값 버린다)
___

# 객체지향 프로그래밍(추상화)
## 구조체
- 구조체(추상화), 인스턴스(구체화)
- 변수값과 메소드 등 여러 데이터를 한꺼번에
- 초기화 기능의 기본생성자 init 메소드 반드시 만든다
- rect() = rect.init()

```swift
struct Milk {
    let brand : String
    let amount : Int
    let title : String
    let type : MilkType
}

enum MilkType {
    case Blueberry
    case Banana
    case Choco
}

//instance
let bananaMilk1 = Milk(brand : "seoul", amount : 150, type : .banana)

```
- 좌표로 사각형 만들기
```swift
struct MyRect {
    var pointA : CGPoint
    var pointB : CGPoint
    var pointC : CGPoint
    var pointD : CGPoint
    
    init() {
        pointA = CGPoint(x : 0, y : 0)
        pointB = CGPoint(x : 0, y : 0)
        pointC = CGPoint(x : 0, y : 0)
        pointD = CGPoint(x : 0, y : 0)
    }
    
    init(origin : CGPoint, width : Double, height : Double) {
        pointA = origin
        pointB = CGPoint(x : origin.x, y : origin.y + CGFloat(height))
        pointC = CGPoint(x : origin.x + CGFloat(width), y : origin.y + CGFloat(height))
        pointD = CGPoint(x : origin.x + CGFloat(width), y : origin.y)
    }
    
    mutating func moveTo(delta : CGPoint) {
        pointA = CGPoint(x : pointA.x + delta.x, y : pointA.y + delta.y)
        pointB = CGPoint(x : pointB.x + delta.x, y : pointB.y + delta.y)
        pointC = CGPoint(x : pointC.x + delta.x, y : pointC.y + delta.y)
        pointD = CGPoint(x : pointD.x + delta.x, y : pointD.y + delta.y)
        
    }
}

var rect1 = MyRect()
print(rect1)
var rect2 = MyRect(origin: CGPoint(x : 0, y : 0), width: 3, height: 5)
print(rect2)
rect2.moveTo(delta: CGPoint(x : 3, y : 5))
print(rect2)
```

# module
- 파일 하나가 기능단위가 되도록 해야 재사용 용이
- 만들 때(class)와 사용할 때(instance- main.swift)를 파일을 나눠서 구분해라


# class(구조체와의 차이점)
- 상속
- 참조
- override 재정의
- super 부모객체

## 객체(class, struct, instance)
- 종속과목강문계(추상화, 상속) 
- 코코아 프레임워크(class) + 스위프트표준 라이브러리(struct) = ios app

## oop 용어
### 캡슐화
- 메소드만 보이게하고 전역변수는 감추기
- 변수를 메소드 안에 넣어서 변경
- 인스턴스에서 클래스의 변수를 직접 변경하지 못하도록

### 인스턴스의 identity와 equality
- 클래스의 인스턴스는 참조만
- 구조체의 인스턴스는 복제
- identity 비교 === class 비교
- equality 비교 == 값만 비교
- 구조체는 stack에 생긴다(함수 스코프가 끝나면 사라진다)
- class 인스턴스는 heap에 생겨서 stack에서 참조(함수 스코프가 끝나도 사용가능)
