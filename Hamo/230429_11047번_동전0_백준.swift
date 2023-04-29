// 그냥 푼거
import Foundation

let info = readLine()!.split(separator: " ").map { Int($0)! }

let N = info[0]
var K = info[1]
var arr: [Int] = []
var dp: [Int] = Array(repeating: 0, count: N + 5)
var coinCount: Int = 0

for _ in 1...N {
    let input = Int(readLine()!)!
    arr.append(input)
}

arr = arr.reversed()

for element in arr {
    if Int(K / element) != 0 {
        coinCount += K / element
        K %= element
    }
    
    if K == 0 {
        break
    }
}

print(coinCount)
