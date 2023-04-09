import Foundation

let NnM = readLine()!.split(separator: " ").map { Int($0)! }
let num = NnM[0]
let count = NnM[1]

var arr: [Int] = Array(repeating: 0, count: count)
var isUsed: [Bool] = Array(repeating: false, count: num)

func backTracking(current: Int) {
    if current == count {
        arr.forEach { print($0, terminator: " ") }
        print("")
        return
    }
    
    for i in 1...num {
        if !isUsed[i - 1] {
            arr[current] = i
            isUsed[i - 1] = true
            backTracking(current: current + 1)
            isUsed[i - 1] = false
        }
    }
}

backTracking(current: 0)
