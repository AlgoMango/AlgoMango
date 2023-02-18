import Foundation

let count = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...count {
    let number = Int(readLine()!)!
    
    if number == 0 {
        stack.popLast()
    } else {
        stack.append(number)
    }
}

print(stack.reduce(0, +))
