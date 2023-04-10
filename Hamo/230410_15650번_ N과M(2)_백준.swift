import Foundation

let NnM = readLine()!.split(separator: " ").map { Int($0)! }
let max = NnM[0]
let count = NnM[1]

var results: [[Int]] = []
var arr: [Int] = Array(repeating: 0, count: count)
var isUsed: [Bool] = Array(repeating: false, count: max)

func backTracking(current: Int) {
    if current == count {
        arr.forEach { print($0, terminator: " ") }
        print("")
        return
    }
    
    for i in 1...max {
        if current == 0 {
            arr[current] = i
            isUsed[i - 1] = true
            backTracking(current: current + 1)
            isUsed[i - 1] = false
        } else if !isUsed[i - 1] && arr[current - 1] < i {
            arr[current] = i
            isUsed[i - 1] = true
            backTracking(current: current + 1)
            isUsed[i - 1] = false
        }
    }
    
    if current == 0 {
        arr = Array(repeating: 0, count: count)
    }
}

backTracking(current: 0)
