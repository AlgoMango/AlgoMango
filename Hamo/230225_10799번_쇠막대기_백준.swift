import Foundation

let input = readLine()!.replacingOccurrences(of: "()", with: ".").trimmingCharacters(in: ["."])
var stack: [Character] = []
var result = 0

for element in input {
    if element == "(" {
        stack.append(element)
    } else if element == "." {
        result += stack.count
    } else {
        stack.popLast()
        result += 1
    }
}

print(result)
