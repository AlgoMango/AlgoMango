import Foundation

let numberCount = Int(readLine()!)!
let numbers: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var stack: [Int] = []

var results: [Int] = Array(repeating: -1, count: numberCount)

for index in 0..<numbers.count {
    while !stack.isEmpty {
        if numbers[index] > numbers[stack.last!] {
            let last = stack.removeLast()
            results[last] = numbers[index]
        } else {
            break
        }
    }
    
    stack.append(index)
}

print(results.map { String($0) }.joined(separator: " "))
