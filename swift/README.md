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
- private var


### 인스턴스의 identity와 equality
- 클래스의 인스턴스는 참조만
- 구조체의 인스턴스는 복제
- identity 비교 === class 비교
- equality 비교 == 값만 비교
- 구조체는 stack에 생긴다(함수 스코프가 끝나면 사라진다)
- class 인스턴스는 heap에 생겨서 stack에서 참조(함수 스코프가 끝나도 사용가능)

# class 만들기
- 변수 타입선언
- 생성자함수(초기화)
- 메소드 만들기(getter, setter)

# 상속
## reference
- 데이터타입은 구조체
- 구조체 인스턴스를 변수에 할당하면 복사된다, identity가 다르다 별개다
- 클래스 타입은 값을 참조, 따라서 변경시 조심해야한다
- 매개변수를 참조값으로 해서 원본을 변경하고 싶을 때 inout, & 

## 상속
- 부모 <- 자식 (자식이 부모의 메소드 호출 가능)
- 상속하면 자식에서 추가한 만큼만 메모리가 늘어난다
- 변수와 메소드를 어느 클래스에 배치하느냐가 중요
- 메소드의 다형성(같은 함수의 이름이지만 어느 클래스에서 호출되느냐에 따라 다른 것)
- 오버라이드(재정의, 덮어쓰기) 가능하므로 인스턴스마다 메소드의 다형성 발생
- var animalArray : [Animal] = [animal, dog, cat]
- for x in animalArray {x.speak()}

### interface 상속
- 구현상속 말고 인터페이스 상속이 대세

### 접근제어
- private - 객체 내,
- file private - 파일 내, 상속 가능(부모자식 클래스를 한 파일에 가능)
- internal -  프로젝트 내(디폴트값)
- 클래스 앞에 지정 또는 변수나 메소드 앞에 지정
- 클래스가 private이면 클래스 내 변수가 public 이더라도 변수 접근 불가

### 생성자
- Designated initializer = 항상 있어야 하는 애 init(), super.init, 상속
- Convenience initializer = 편의를 위해 만드는 것, self.init
- 두단계초기화 = 내것부터 초기화한 후 부모 초기화
---

# 애플의 프레임워크 클래스 사용하기
## 표준라이브러리(struct)
- 기능단위 묶음
- import 안해도 사용가능


## 파운데이션(kit, class)
- import Foundation
- 코코아 터치 프레임워크 = foundation + uikit
- 스위프트용과 오브젝티브C용으로 나뉘어있다
- NS class (class 의 인스턴스들만 다룬다)
- filemanager, range(4...7 4부터 7까지), cgpoint, cgsize, cgrect(cgpoint, cgsize), strings(NSString=let, NSMutableString=var), serching strings(NSRange- 4,4오브젝티브C 4부터 시작해서 4개), array(mutable, immutable), dictionary(mutable, immutable), 
- iteration(map), sorting, filtering
- date and time(dateformatter 으로 기준타입 지정이 중요하다, 서버랑 통신할 때)

# 런타임
- 실행중에 처리해주는 함수들
- 실행중에 특정 객체에 메소드가 있는지 동적으로 확인해서 실행시켜준다
- 찾을 때 hash 키를 만들어서 찾는다 (다이나믹 디스패치)
- 오브젝티브C 에서는 실행중에 메소드를 몰래 바꿔치기 하기 (게릴라 -> 고릴라 -> monokey patch)
- 몽키패치로 점검중이라고 서비스 중지하지 않고 보수가 가능해진다
- method hooking (다른 함수들을 호출될때마다 내 메소드를 거쳐가게끔)
- swift에서도 perform selector(찾아서 있으면 메소드 실행해주는것) 있지만 찾는 메소드가 없으면 프로그램 죽는다
---

# 앱
- oulet = 화면관련 속성 변경 -> 변수
- action = 이벤트 -> 메소드
- class UIViewController
- class 역할에 따라 분류 = M(추상화된 데이터)-V(뷰)-C(컨트롤러) 패턴
- window.rootViewController = 화면을 가득 채우는 것, 가장 맨 밑바닥 화면인 윈도우를 조절하는 뷰컨트롤러
- window - tab bar - navigation bar ..

## tab bar
- scene - segue way - scene

## navigation controller
- 제목줄

## ui event
- 터치, 모션, 리모컨
- nsobject - uiresponder(터치) - uiview(그리기)
- touchbegin , touchmove, touchend, touchcancle
- touchesForView = 좌표 기준 설정


## 콜백
- 동기 = 내가 함수 호출해야만 실행
- 비동기 = 내가 함수 호출 안해도 조건에 따라서 호출된다 (애플 앱 방식)
---

# MVC
## view controller
- 인스턴스 생성
- main.swift
- class의 메소드를 바로 사용 가능

## app delegate
- 앱 단위 이벤트
- 앱 실행에서 종료까지의 life cycle
- class의 메소드 사용하려면 vc를 통해 가져와야한다

### 앱 상태 (특정 앱 기준으로 홈버튼에 따라)
- 실행 직후 = didfinishlaunching
- 활성화 직후 = didbecomeactive
- 홈버튼 더블클릭 직후 = willresignactive
- 뒤에꺼 누른 직후 = didenterbackground(원래 하던 앱은 running or suspend)
- 바로 복귀 = willenterforeground, didbecomeative
- 자동으로 꺼진다 = 
- 수동으로 끈다 = willterminate
- 꺼진후 복귀 = didfinishlauching, willenterforeground, didbecomeactive
---

# data 저장
## xml, 아카이브
### property list
- 파일 읽고 쓰기
- NSUserDefault = local storage 같은 건가봐
- 앱의 상태에 따라 재고를 어디더 둘건지

# MVC 패턴
- target-action
- observer = 모델의 값 변할 때를 확인
- View(재고추가버튼 클릭) -> Controller(func add) -> Model(자판기 code) ->NSNotification center -> Controller(callback 호출) -> View(업데이트)
- model = 데이터
- view = 화면
- controller = model 과 view 중개, delegate
---

# delegate 위임
- app delegate (경우의 수에 따라 이러이러한 코드를 실행해줘)
- don't call me, i will call you
- will(직전)
- did(직후)
- should (bool 을 받는다)
- 앱 만들때, 화면 하나당 + 뷰 컨트롤러 1 + 모델 1 로 관리해야 나중에 보수에 용이

# loose coupling (의존성을 최대한 줄이기)
- 다른 객체를 변수로 참조하면 의존성이 커지므로 이를 줄이기 위해 notification center 사용
- key value observing
- model - (notification) - controller - (notification) - view
___

# 클래스 객체 복사
- 객체 인스턴스는 참조만 가능
- mutableCopy 메소드로 복사 가능
- 우리가 만든 인스턴스를 카피하려면 extension으로 nscopying 구현해야 한다

# NSKeyedArchive(깊은 저장하기, 깊은 가져오기)
- 객체 참조 그래프를 저장해서 깊은 복사 가능
- object graph = 참조관계 트리
- NSCoding(encode 저장, decode 풀기) 구현해야 아카이브 가능
- NSCoding을 위한 클래스는 NSObject에서 상속받아야함
---

# 좌표시스템
- 375 x 667
- bound = 내 원점에서 가로세로 거리
- frame = 부모 원점에서 내 원점 거리
---

# 서버
- 주소 -> 포트
- TCP(상호작용), UDP(일방적 송신)
- json = model에서 동작
- nsurlsession = http 사용하려면
- 5가지 거치면 통신할 수 있다



## nsurlsession
- 

## Reachability
- 비용 줄이기
- 캐시 이용하기
- temp 디렉토리에 저장
---

# 메모리 부족할 경우(사용하지 않는 참조변수 화살표개수 관리)
- 참조 화살표 끊기(참조변수 = nil)
## 수동관리
- memorywarning 함수
- 백그라운드의 앱들을 죽이기
- ownership(참조)) = 만들고나서 사용할 때 retain(잡았다,+1), 안 쓸 때 release(놓기, -1)하고 deolloc(0)소멸 책임
- retain count 0 이되면 안쓰는 거니까 소멸
- autorelease = 소유권은 내가 갖고 있지 않고 0이 되면 자동으로 release

## 자동관리
- 순환참조는 그냥 참조변수만 끊는다고 해도 참조개수가 0이 되지 않음
- 그래도 상호 참조를 해야하면 약한 참조(참조수 증가 안한다)를 해야함
- 객체가 사라지면 강한 참조는 유지되지만 약한참조는 nil로 바뀜
- 미소유참조 = 깩체가 존재할 경우만 참조
- 만들었다 없앴다 하는 애들은 autoreleasepool에 넣어라

