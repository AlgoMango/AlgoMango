import Foundation

let N = Int(readLine()!)!
var times: [Int] = []
var money: [Int] = []
var dp: [Int] = Array(repeating: 0, count: N + 1)

for _ in 1...N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    times.append(input[0])
    money.append(input[1])
}

times = [0] + times.reversed()
money = [0] + money.reversed()

for i in 1...N {
    if i < times[i] {
        dp[i] = dp[i - 1]
    } else {
        dp[i] = max(dp[i - 1], dp[i - times[i]] + money[i])
    }
}

print(dp[N])
