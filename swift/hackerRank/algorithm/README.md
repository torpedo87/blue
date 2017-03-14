# [Simple Array Sum](https://www.hackerrank.com/challenges/simple-array-sum)
```swift
import Foundation

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// find and print the sum of array
var sum = 0;
for num in arr {
    sum = sum + num;
}
print(sum);
```
---

# [A Very Big Sum](https://www.hackerrank.com/challenges/a-very-big-sum)
```swift
import Foundation

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var sum = 0
for num in arr {
    sum += num
}
print(sum)
```
---
