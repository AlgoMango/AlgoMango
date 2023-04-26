import Foundation

let count = Int(readLine()!)!
var red: [Int] = []
var green: [Int] = []
var blue: [Int] = []

var arr: [[Int]] = Array(repeating: [0, 0, 0], count: count)

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    red.append(input[0])
    green.append(input[1])
    blue.append(input[2])
}
arr[0][0] = red[0]
arr[0][1] = green[0]
arr[0][2] = blue[0]

for i in 1..<count {
    arr[i][0] = min(arr[i - 1][1], arr[i - 1][2]) + red[i]
    arr[i][1] = min(arr[i - 1][0], arr[i - 1][2]) + green[i]
    arr[i][2] = min(arr[i - 1][0], arr[i - 1][1]) + blue[i]
}

print(min(arr[count - 1][0], arr[count - 1][1], arr[count - 1][2]))
