# 스위프트 패키지 매니저
- 라이브러리(모듈만 생성, 실행파일은 생성안함)
- executable(실행파일 생성)

# 라이브러리 설치과정
- 빈폴더 만들기
- swift package init
- package.swift파일에 dependency 추가
- dependencies: [
    .Package(url: "깃헙주소", majorVersion: release버젼)
]
- swift build

# executable 설치과정
- 빈폴더 만들기
- swift package init --type executable
- package.swift파일에 depencency 추가
- dependencies: [
    똑같이
]
- swift build

# kitura package 설치
- appserver 폴더 만들기
- swift package init --type executable
- package.swift파일에 dependency 추가
- swift build
- cocoa rest client 다운 및 실행
- swift package generate-xcodeproj
- open appserver.xodeproj
- main.swift파일에 
```swift
import Kitura
let router = Router()
router.get("/") { (request, repose, next) in
    response.send("hello")
    next()
}
Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()

```
- rest client에서 실행해보기

# static file server 설정
```swift
import Kitura
let router = Router()
router.get("/") { (request, repose, next) in
    response.send("hello")
    next()
}

router.all("/static", middleware: StaticFileServer())

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()

```
- mkdir public
- public 에 html파일, 이미지파일 등등 복사
- 프로젝트 빌드
- 로컬호스트 들어가보기
- package.swift파일에 heliumlogger 깃헙주소 추가
- swift build
- swift package generate-xcodeproj
- open appserver.xcodeproj
```swift
import Kitura
import HeliumLogger

HeliumLogger.use(.verbose)

let router = Router()
router.get("/") { (request, repose, next) in
    response.send("hello")
    next()
}

router.all("/static", middleware: StaticFileServer())

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()

```
