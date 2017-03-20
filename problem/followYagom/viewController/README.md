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

