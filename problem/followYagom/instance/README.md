```swift
//구조체는 자동으로 멤버와이즈 초기화함수가 생성된다
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point.init(x: 3.0, y: 5.0)
let size: Size = Size.init(width: 3.2, height: 4.5)


//초기화 위임
enum Student {
    case elementary, middle, high
    case none
    
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)

// 실패 가능한 초기화함수
class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let jun: Person? = Person(name: "jun", age: 30)
if let person: Person = jun {
    print(person.name)
} else {
    print("person was not initialized")
}

//열거형의 실패가능한 초기화함수(열거형의 rawValue)
enum Students: String {
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            return nil
            
        }
    }
    
    init?(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var young: Students? = Students(rawValue: "대학생")

//클로저 이용한 초기화
struct CloserStudent {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [CloserStudent] = {
        //새로운 인스턴스 생성
        var arr: [CloserStudent] = [CloserStudent]()
        
        for num in 1...15 {
            var student: CloserStudent = CloserStudent(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)

//파일매니저 deinitializer
class FileManager {
    var fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("open file : \(self.fileName)")
    }
    
    func modifyFile() {
        print("modify file : \(self.fileName)")
    }
    
    func writeFile() {
        print("wirte file : \(self.fileName)")
    }
    
    func closeFile() {
        print("close file : \(self.fileName)")
    }
    deinit {
        print("deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")
if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil


```