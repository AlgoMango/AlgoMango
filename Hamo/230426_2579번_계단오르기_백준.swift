import Foundation

var count = Int(readLine()!)!
var stairs: [Int] = Array(repeating: 0, count: 305)
var results: [[Int]] = Array(repeating: [0, 0, 0], count: 305)

for i in 1...count {
    let input = Int(readLine()!)!
    stairs[i] = input
}

results[1][1] = stairs[1]
results[2][1] = stairs[2]
results[2][2] = stairs[2] + stairs[1]

if count == 1 || count == 2 {
    print(max(results[count][1], results[count][2]))
    exit(0)
}

for i in 3...count {
    results[i][1] = max(results[i - 2][1], results[i - 2][2]) + stairs[i]
    results[i][2] = results[i - 1][1] + stairs[i]
}

print(max(results[count][1], results[count][2]))
