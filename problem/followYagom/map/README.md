```swift
//짝수를 걸러내어 각 값에 3을 곱해준 후 모든값을 더한다
let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]

var result: Int = numbers.filter{ $0 % 2 == 0 }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
print(result)
//36

enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()

//서울 외 지역에 거주하며 25세 이상
var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }
result = result.filter{ $0.location != "서울", && $0.age >= 25 }
let String: String = result.reduce("해당 친구는") { $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)" }

```