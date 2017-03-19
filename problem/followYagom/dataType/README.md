```swift
var str = "Hello, playground"

//tuple
typealias PersonTuple = (name: String, age: Int, height: Double)
let yagon: PersonTuple = ("yagom", 100, 178.5)
let eric: PersonTuple = ("eric", 150, 166.3)
yagon.height
eric.age

//삼항 연산자
var valueA: Int = 3
var valueB: Int = 5

var biggerValue: Int = valueA > valueB ? valueA : valueB
valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB

//nil 병합 연산자(A가 nil 아니면 A 반환하고 nil이면 0을 반환)
//let valueInt: Int = A ?? 0


```