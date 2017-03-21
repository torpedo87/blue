```swift
//타입캐스팅(인스턴스 사용할 때 어떤 타입으로 다룰지 판단)
class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

//is(인스턴스가 어떤 클래스의 인스턴스인지)
let coffee: Coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)

//인스턴스의 클래스 비교
print(myCoffee is Coffee)
print(myCoffee is Latte)

//타입값 비교
print(type(of: myCoffee) == Americano.self)

//다운캐스팅
//myCoffee가 참조하는 인스턴스가 Americano타입의 인스턴스라면 actingOne이라는 임시상수에 할당하라
if let actingOne: Americano = myCoffee as? Americano {
    print("This is americano")
} else {
    print(coffee.description)
}


// Any
func checkAnyType(of item: Any) {
    
    switch item {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integet value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    default:
        let type: String = String(describing: type(of: item))
        print("something else : \(type)")
    }
}

```