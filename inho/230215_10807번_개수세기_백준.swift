import Foundation

let count = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }
let targetNumber = Int(readLine()!)!

print(numbers.filter { $0 == targetNumber }.count)
