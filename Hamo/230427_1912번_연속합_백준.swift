import Foundation

let n = Int(readLine()!)!
var sequence: [Int] = []
var arr: [Int] = Array(repeating: 0, count: n)

let input = readLine()!.split(separator: " ").map { Int($0)! }
sequence += input
arr[0] = sequence[0]

if n == 0 {
    print(sequence[0])
    exit(0)
}

for i in 1..<n {
    arr[i] = max(sequence[i], sequence[i] + arr[i - 1])
}

print(arr.max()!)
