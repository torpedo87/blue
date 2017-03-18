```swift
// 저장 프로퍼티
struct CoordinatePoint {
    var x : Int
    var y : Int
}

let somePoint: CoordinatePoint = CoordinatePoint(x: 3, y: 5)


class Position {
    //변수에 초기값 지정 안해주면
    var point : CoordinatePoint
    let name : String
    
    //초기화함수 사용해야 인스턴스 생성가능
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let somePosition: Position = Position(name: "jun", currentPoint: somePoint)



struct CodiPoint {
    var x:Int = 0
    var y:Int = 0
}
let junPoint: CodiPoint = CodiPoint()

class PersonPosition {
    //초기값 미리 지정해주면 인스턴스 생성시 초기화함수 사용 안해도 됨
    var point: CodiPoint = CodiPoint()
    var name: String = "unknown"
}
let junPosition: PersonPosition = PersonPosition()


//옵셔널 프로퍼티는 초기화함수에 넣어주지 않아도 됨 나중에 인스턴스 생성하고 나중에 따로 값 넣어줄 수 있다
class OptionalPosition {
    var point: CoordinatePoint?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let junwooPosition: OptionalPosition = OptionalPosition(name: "junwoo")
junwooPosition.point = CoordinatePoint(x: 3, y: 5)


// 지연 저장 프로퍼티
struct lazyPoint {
    var x: Int = 0
    var y: Int = 0
}

class SomePosition {
    lazy var point: lazyPoint = lazyPoint()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let minhaPosition: SomePosition = SomePosition(name: "minha")
// 인스턴스 생성될때에는 point 프로퍼티 안 만들어지고 나중에 호출될 때에 만들어져서 메모리 효율적 이용





// 연산 프로퍼티  getter, setter
struct comPropertyPoint {
    var x: Int
    var y: Int
    
    var oppositePoint: CoordinatePoint {
        //읽기전용은 가능하지만 쓰기전용으로 set만 지정해줄 수는 없다
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        set {
            x = -newValue.x
            y = -newValue.y
        }
    }
}

//프로퍼티 감시자
class Account {
    var credit: Int = 0 {
        //변경 직전 호출되는 감시자
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정")
        }
        //변경 직후 호출되는 감시자
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)으로 변경됨")
        }
    }
    
    var dollarValue: Double {
        get {
            return Double(credit)/1000.0
        }
        set {
            credit = Int(newValue*1000)
            print("잔액을 \(newValue)달러로 변경중")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정")
        }
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경됨")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
myAccount.credit = 1000
//잔액이 0원에서 1000원으로 변경될 예정
//잔액이 0원에서 1000으로 변경됨

myAccount.dollarValue = 2
//잔액이 1.0달러에서 2.0달러로 변경될 예정
//잔액이 1000원에서 2000원으로 변경될 예정
//잔액이 1000원에서 2000으로 변경됨
//잔액을 2.0달러로 변경중
//잔액이 1.0달러에서 2.0달러로 변경됨


// static 타입 프로퍼티와 인스턴스 프로퍼티
class AClass {
    //타입 프로퍼티는 인스턴스 생성안해도 사용 가능
    static var typeProperty: Int = 0
    var instanceProperty: Int = 0 {
        didSet {
            AClass.typeProperty = instanceProperty + 100
        }
    }
    
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123
let classInstance: AClass = AClass()
classInstance.instanceProperty = 100
AClass.typeProperty
AClass.typeComputedProperty


class TypeAccount {
    static let dollarExchangeRate: Double = 1000.0
    var credit: Int = 0
    var dollarValue: Double {
        get {
            return Double(credit) / TypeAccount.dollarExchangeRate
        }
        
        set {
            credit = Int(newValue * TypeAccount.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경중")
        }
    }
}

//인스턴스내부의 값 변경하는 메소드는 mutating 붙이기

struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("level up")
        level += 1
    }
    
    mutating func levelDown() {
        print("level down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int) {
        print("jump to \(to)")
        level = to
    }
    
    mutating func reset() {
        print("reset")
        level = 0
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.levelDown()
levelStructInstance.levelDown()
levelStructInstance.jumpLevel(to: 3)

//self
enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()


//type method 는 static(재정의 가능) class(재정의 불가) 두가지
// type mothod의 self는 타입을 가리키고 인스턴스 메소드의 self는 인스턴스를 가리킨다
struct SystemVolume {
    static var volume: Int = 5
    
    static func mute() {
        self.volume = 0
    }
}

class Navigation {
    var volume: Int = 5
    func guideWay () {
        //타입 메소드는 인스턴스 안거쳐도 사용가능
        SystemVolume.mute()
    }
    
    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

//타입 프로퍼티는 인스턴스 안 거치고 접근 가능
SystemVolume.volume = 10        //시스템 볼륨을 키움
let myNavi: Navigation = Navigation()
myNavi.guideWay()  //시스템볼륨을 낮춤
SystemVolume.volume
myNavi.finishGuideWay()       // 시스템 볼륨을 네비볼륨으로 다시 높임
SystemVolume.volume


```