import Foundation

let count = Int(readLine()!)!
var A: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var B: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var result = 0

for _ in 1...count {
    let a = A.removeLast()
    let b = B.removeLast()
    
    result += a * b
}

print(result)
