# 인터넷 위에서 www 이 작동된다

# www 3요소
- url = html 주소
- http = 통신규약
- html = 정보
- client = html 요청
- server = html 보내기
- TCP, IP = 통신 네트워크

# 통신 네트워크 4 layer
- 실제 업무는 밑에층에 위임하는 구조
- application(배트맨) = 택배 잘 받았냐
- transport(집사) = 택배 10개 받았냐, TCP(포장)
- internet(택배기사) = 컨테이너 잘 받았냐, IP(포장+집주소)
- network interface = 컨베이어벨트(실제수행자)
---

# 백엔드
## prerequisites = 선요구사항
- 우분투 리눅스 로그인
- 우분투 업데이트
- 스위프트 toolchain 설치
- rest client = 서버가 제대로 동작하는지 테스트

## 패키지매니저
- xcode = 프로젝트 관리하는 매니저
- 코코아팟 = 라이브러리 관리
- 패키지매니저 = 코코아팟처럼 라이브러리 관리
- 패키지매니저를 통해 프로젝트 만들 수 있다
- package.swift = 의존성, 로그추가, swiftyJSON
- source = 실행파일, import Kitura, 라우터
- swift build(PATH)

# request
## 라우터(get)
- static file은 public 폴더에서 찾아서 알려준다
- url(클라이언트와 서버에서 주고받는 key값) = protocol://id@hostname:port/resource주소/?q=xxx&p=yyy
- url= api/version1, api/version2
- 한글, 특수문자, 공백 = url 인코딩 필요
- 쿼리 파람 = ?key=value


## post
- url의 한계 극복, 파일(data) 전송
- header(contentlength) + body(content)

## 여러 요청메소드
- post(생성), get(찾아서 불러오기), delete, patch(일부변경), put(통째로 변경)

# response api
- 클라이언트 개발자와 서버개발자가 함께 reponse format 정한다
- 200 번대 = 성공
- 400 번대 = 요청이 잘못됨
- 500 번대 = 요청은 맞는데 서버가 처리불가

