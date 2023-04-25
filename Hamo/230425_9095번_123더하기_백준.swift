import Foundation

let count = Int(readLine()!)!
var target: [Int] = []
var solution: [Int] = Array(repeating: 0, count: 11)
solution[0] = 1
solution[1] = 2
solution[2] = 4

for _ in 1...count {
    let input = Int(readLine()!)!
    
    target.append(input)
}

for i in 3...9 {
    solution[i] = solution[i - 3] + solution[i - 2] + solution[i - 1]
}

for element in target {
    print(solution[element - 1])
}

// 1 =
// 1

// 2 =
// 1 + 1
// 2

// 3 =
// 1 + 1 + 1, 2 + 1
// 1 + 2
// 3

// 4 =
// 1 + 1 + 1 + 1, 2 + 1 + 1, 1 + 2 + 1, 3 + 1
// 1 + 1 + 2
// 2 + 2
// 1 + 3
