//: Playground - noun: a place where people can play

import Cocoa

//정규표현식 써서 한글 추출하고 싶은데 뭐가 문제일까
extension String {
    func capturedGroups(withRegex pattern: String) -> [String] {
        var results = [String]()
        
        var regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch {
            return results
        }
        
        let matches = regex.matches(in: self, options: [], range: NSRange(location:0, length: self.characters.count))
        
        guard let match = matches.first else { return results }
        
        let lastRangeIndex = match.numberOfRanges - 1
        guard lastRangeIndex >= 1 else { return results }
        
        for i in 1...lastRangeIndex {
            let capturedGroupIndex = match.rangeAt(i)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
        }
        
        return results
    }
}

"http://www.osxdev.org/forum/index.php?threads/swift-2-0에서-try-catch로-fatal-  error-잡을-수-있나요.382".capturedGroups(withRegex: "/[가-힣]/g")
