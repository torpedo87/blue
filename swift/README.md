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