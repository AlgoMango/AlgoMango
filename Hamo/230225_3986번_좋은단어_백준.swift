import Foundation

let wordCount = Int(readLine()!)!
var result = 0

for _ in 1...wordCount {
    let word = readLine()!
    var stack: [Character] = []
    
    for element in word {
        if stack.isEmpty {
            stack.append(element)
            continue
        }
        
        if stack.last == "A" && element == "A" {
            stack.popLast()
        } else if stack.last == "B" && element == "B" {
            stack.popLast()
        } else {
            stack.append(element)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)
