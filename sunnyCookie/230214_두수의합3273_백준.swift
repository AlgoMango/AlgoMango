//https://www.acmicpc.net/problem/3273

import Foundation

let arrayCount = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let sum = Int(readLine()!)!
var result = 0
var leftIndex = 0
var rightIndex = arrayCount - 1

while leftIndex < rightIndex {
    let value = array[leftIndex] + array[rightIndex]

    if sum == value {
        leftIndex += 1
        rightIndex -= 1
        result += 1
    } else if sum < value {
        rightIndex -= 1
    } else if sum > value {
        leftIndex += 1
    }
}

print(result)

// 투 포인터: 리스트 1회 순회 -> O(n)
// for-in 중첩하면 O(n²)
