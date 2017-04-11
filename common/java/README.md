# 자바
- C언어에 객체지향을 넣은 언어
- public class Hello
- class 이름은 대문자로 시작, 파일 이름은 퍼블릭 클래스명과 동일해야한다
- public class의 main method부터 실행된다
- 컴파일(.class) = javac Hello.java
- 실행 = java Hello

## primitive vs class
- primitive 변수 = stack에 저장(값 저장)
- class 인스턴스 = heap에 저장(주소 저장)

## String
- class 이지만 primitive와 유사
- immutable = 값을 못바꾸므로 매번 새로운 객체를 만들고 주소를 바꾼다
- class이지만 인스턴스 생성시 new 없이 만들 수 있다

# class vs object
- 클래스로부터 오브젝트를 생성한다

# class
- db에 저장할 것들을 클래스로 만든다
- 추상적 개념(포유류)
- abstract method = 정의만 되어있고 구현안된 것(잘 모르겠으니 상속자가 대신 구현해줘)
- 추상클래스 = 하나 이상의 추상메소드를 지님. 추상적 개념(포유류)이므로 포유류에 대한 객체를 만들어낼 수 없다(스위프트의 프로토콜과 비슷)

# 상속
- 자바는 다중상속이 안된다. 부모를 하나만 갖는다
- 익셉선 = 닭은 날지 못한다, 구현 해주되 fly() { error }
- 인터페이스(flyable) = 능력에 관한 내용, 추상메소드만 있는 클래스, 박쥐 implemennts flyable(다중상속 가능)

# 배열
- 배열도 객체라서 인스턴스 생성 가능?
- 2차원 배열 = int[][] b = new int[5][10]
```swift
Car[] c = new Car[3];
c[0] = new Car();
c[0].name = "subway";
```
- List = 실제 object를 담는게 아니라 object의 참조값을 담는 배열
- 제네릭 - 아무거나 담을 수 있는 그릇, 인스턴스를 만들 때 타입을 지정
---



