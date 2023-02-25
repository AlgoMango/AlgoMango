import Foundation

let input = readLine()!.replacingOccurrences(of: "()", with: ".").replacingOccurrences(of: "[]", with: ",")
var stack: [Character] = []
var stackValue = 1
var result = 0

for element in input {
    if stack.isEmpty && (element == "]" || element == ")") {
        result = 0
        break
    }
    
    if element == "(" {
        stack.append(element)
        stackValue *= 2
    } else if element == "[" {
        stack.append(element)
        stackValue *= 3
    } else if element == "." {
        result += stackValue * 2
    } else if element == "," {
        result += stackValue * 3
    } else if element == ")" && stack.last == "(" {
        stack.popLast()
        stackValue /= 2
    } else if element == "]" && stack.last == "[" {
        stack.popLast()
        stackValue /= 3
    } else if element == ")" || stack.last == "]" {
        result = 0
        break
    }
}

if !stack.isEmpty {
    result = 0
}

print(result)
