```swift
//구조체, 클래스 = 프로퍼티와 메소드를 지닌다

// 클래스 인스턴스의 생성과 소멸
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("인스턴스가 소멸됩니다")
    }
}

var jun: Person? = Person()   //생성
jun = nil //소멸



// 값 타입과 참조 타입
struct BasicInformation {
    let name: String
    var age: Int
}

var junInfo: BasicInformation = BasicInformation(name: "jun", age: 31)
junInfo.age = 32

var minInfo: BasicInformation = junInfo

junInfo.age
minInfo.age

minInfo.age = 31

junInfo.age
minInfo.age


class Persons {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var junwoo: Persons = Persons()
var minha: Persons = junwoo
junwoo.height
minha.height

minha.height = 162
junwoo.height

//값 인자를 임시 카피변수에 담아서 변경하지 않고 바로 변경하고 싶을 때에는 inout 사용해라
func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age=1
}

//참조 인자
func changePersonsInfo(_ info: Persons) {
    info.height = 173
}

changeBasicInfo(junInfo)
junInfo.age

changePersonsInfo(junwoo)
junwoo.height



```