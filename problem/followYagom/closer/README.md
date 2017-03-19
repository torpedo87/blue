```swift
//정렬을 위한 함수
let names: [String] = ["ww", "ee", "yy", "jj"]
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}
let reversed: [String] = names.sorted(by: backwards)
print(reversed)

//closer
let closerReversed: [String] = names.sorted (by: { (first: String, second: String) -> Bool in return first > second
})
print(closerReversed)

//trailing closer
let tCloserReversed: [String] = names.sorted { (first: String, second: String) -> Bool in return first > second
}

//매개변수와 반환타입 생략가능
let shortCloser: [String] = names.sorted { $0 > $1 }


```