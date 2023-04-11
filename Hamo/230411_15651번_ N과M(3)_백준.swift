import Foundation

let NnM = readLine()!.split(separator: " ").map { Int($0)! }
let maxNum = NnM[0]
let count = NnM[1]

var arr: [String] = Array(repeating: "", count: count)
var isUsed: [Int] = Array(repeating: 0, count: maxNum)
var result: String = ""

func backTracking(current: Int) {
    if current == count {
        result += arr.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 1...maxNum {
        if isUsed[i - 1] < count {
            arr[current] = String(i)
            isUsed[i - 1] += 1
            backTracking(current: current + 1)
            isUsed[i - 1] -= 1
        }
    }
}

backTracking(current: 0)
print(result)
