# view controller
- content controller(view + viewcontroller) -> container controller(nav, tabbar) -> window
- 스토리보드로 만들 때 view는 무조건 view controller로 연결

## navigation controller
- nav controller(nav bar)- rootview controller - viewcontroller(navigation item)
- 클릭해서 들어가기 = pushviewController:animated(메소드) 호출됨
- 뒤로 = popviewcontroller:animated(메소드) 호출됨
- navigation stack(rootview 위에 viewcontroller들이 push 쌓이거나,  pop 빼내어짐)
- topviewcontroller = 스택의 제일 위에 있는 view controller를 리턴

## 스토리보드와 코드 연결하기
- oulet
- action
---

# data 저장하기
## serialize = 참조점을 기록하지 않는다(nsuserdefault)
## archive = 아이덴티티를 함께 저장

# userdefault
- 수정 가능한 글로벌 딕셔너리
- 로컬 스토리지 비슷
---

# 타입캐스팅(타입 비교)
- if item is Movie
- if let movie = item as? Movie

# 구현 상속을 하지 않고 인터페이스 상속을 해봐라
- 애플이 만들어 놓은 기능 이외에 추가할 수 있다
## 프로토콜(인터페이스 상속)
- 타입이 구현해야하는 함수, 프로퍼티 목록
- 구현해야할 애들을 프로토콜로 받는다(인터페이스 상속)
- 다중상속 가능
- 나만의 기능 추가하기

## extension(인터페이스 상속)
- 구조체 등 상속이 안되는 애들에게 새로운 기능을 추가하고 싶을 때
- 재정의 불가능하고 추가만 가능
- 다른 사람이 만든 것에 기능 추가가 가능
