import Foundation

var results: [String] = []

while true {
    var texts = readLine()!
    var stack: [Character] = []
    
    if texts == "." {
        break
    }
    
    for text in texts {
        if text == "." {
            break
        }
        
        if stack.isEmpty && (text == ")" || text == "]") {
            stack.append(text)
            break
        }
        
        if text == "(" || text == "[" {
            stack.append(text)
        } else if stack.last == "(" && text == ")" {
            stack.popLast()
        } else if stack.last == "[" && text == "]" {
            stack.popLast()
        } else if (text == ")" || text == "]") {
            break
        }
    }
    
    if stack.isEmpty {
        results.append("yes")
    } else {
        results.append("no")
    }
}

print(results.joined(separator: "\n"))
