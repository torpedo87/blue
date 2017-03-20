```swift
class Room {
    var number: Int
    init(number: Int) {
        self.number = number
    }
}

class Building {
    //필수
    var name: String
    
    //선택
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    //필수
    var province: String
    var city: String
    var street: String
    
    //선택
    var building: Building?
    var detailAddress: String?
}

class Person {
    var name: String
    var address: Address?
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")

//optional binding + optional chaining
let yagomRooomViaOptionalChaining: Int? = yagom.address?.building?.room?.number

if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("cannot find room number")
}

//optional chaining을 통한 값 할당(앞의 옵셔널 부터 차례대로 할당해주어야한다)
yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505
print(yagom.address?.building?.room?.number)

//optional subscript 불러올 때
//서브스크립트는 컬렉션의 원소들을 의미하는가보다
let optionalArray: [Int]? = [1,2,3]
optionalArray?[1]

//빠른종료   guard는 return,break,continue,throw을 사용하는 if else 문을 대체 가능하다
for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}

for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}


//guard let (옵셔널 바인딩)
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    print("hello \(name)")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "jenny"

greet(personInfo)

personInfo["location"] = "korea"
greet(personInfo)


```