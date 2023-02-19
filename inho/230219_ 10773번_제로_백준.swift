import Foundation

let count = Int(readLine()!)!
var result: [Int] = []

for _ in 1...count {
    let number = Int(readLine()!)!
    
    if number != 0 {
        result.append(number)
    } else {
        result.removeLast()
    }
}

print(result.reduce(0) { $0 + $1 })
