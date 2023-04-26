import Foundation

let count = Int(readLine()!)!
var tests: [Int] = []
var arr: [(zero: Int, one: Int)] = Array(repeating: (0, 0), count: 45)
arr[0] = (1, 0)
arr[1] = (0, 1)
arr[2] = (1, 1)

for _ in 1...count {
    let input = Int(readLine()!)!
    tests.append(input)
}

for i in 3...40 {
    arr[i].zero = arr[i - 1].zero + arr[i - 2].zero
    arr[i].one = arr[i - 1].one + arr[i - 2].one
}

for element in tests {
    print(arr[element].zero, terminator: " ")
    print(arr[element].one)
}

// 4
// 3 2
// 1 -> 3
// 0 -> 2

// 3
// 2 1
// 1 -> 2
// 0 -> 1

// 2
// 1 0
// 1 -> 1
// 0 -> 1

// 1 -> 1
// 0 -> 0
