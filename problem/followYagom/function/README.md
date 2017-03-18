```swift
var str = "Hello, playground"

//전달인자 레이블 outter inner
func sayHello(from myName: String, to name: String) -> String {
    return "Hello \(name), I'm \(myName)"
}
sayHello(from: "Jun", to: "Min")

//매개변수 이름 없는 함수 (호출할 때에 값만 넣어주면 된다)
func sayHello(_ name: String, _ times:Int) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name)"
    }
    return result
}
sayHello("jun", 2)


// 매개변수가 몇개인지 모를때
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    for friend in names {
        result += "Hello \(friend)" + " "
    }
    result += "I'm \(me)"
    return result
}
sayHelloToFriends(me: "jun", friends: "min", "jisu")
sayHelloToFriends(me: "jun")

//inout 참조매개변수 (참조가 되므로 원본이 변경되니까 주의)
var numbers: [Int] = [1,2,3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
numbers[1]

referenceParameter(&numbers)
numbers[1]


class Person {
    var height : Float = 0.0
    var weight : Float = 0.0
}
var jun:Person = Person()
    
func reference(_ person: inout Person) {
    person.height = 173
    jun.height
    
    person = Person()
}

reference(&jun)
jun.height

// 함수의 타입화
typealias CalculateTwoInts = (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a+b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a*b
}

func returnMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) -> String {
    return "result is \(mathFunction(a, b))"
}

func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

returnMathResult(chooseMathFunction(true), 3, 5)
returnMathResult(chooseMathFunction(false), 3, 5)

// 중첩함수
typealias MoveFunc = (Int) -> Int


func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }

    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3
let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
    print("\(position)")
    position = moveToZero(position)
}



```