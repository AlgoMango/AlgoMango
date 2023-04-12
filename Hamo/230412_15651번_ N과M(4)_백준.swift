import Foundation

let NnM = readLine()!.split(separator: " ").map { Int($0)! }
let maxNum = NnM[0]
let count = NnM[1]

var arr: [Int] = Array(repeating: 0, count: count)
var isUsed: [Int] = Array(repeating: 0, count: maxNum)
var result: String = ""

func backTracking(current: Int) {
    if current == count {
        result += arr.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 1...maxNum {
        if current == 0 {
            arr[current] = i
            isUsed[i - 1] += 1
            backTracking(current: current + 1)
            isUsed[i - 1] -= 1
        } else if isUsed[i - 1] < count && arr[current - 1] <= i {
            arr[current] = i
            isUsed[i - 1] += 1
            backTracking(current: current + 1)
            isUsed[i - 1] -= 1
        }
    }
    
    if current == 0 {
            arr = Array(repeating: 0, count: count)
    }
}

backTracking(current: 0)
print(result)
