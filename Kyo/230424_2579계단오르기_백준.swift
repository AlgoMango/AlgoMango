//230424_2579계단오르기_백준
//살짝컨닝해서 다시풀어야댐

let count = Int(readLine()!)!

// 계단 점수
var stair: [Int] = []

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: count)
/*
 dp[i][k] : i번째 계단 밟았고, 그전에 k개를 연속으로 밟음.
 */

for _ in 0..<count {
    stair.append(Int(readLine()!)!)
}

dp[0][1] = stair[0]

if dp.count > 1 {
    dp[1][1] = stair[1]
    dp[1][2] = stair[0] + stair[1]
    
    for index in 2..<count {
        // index 번째 계단인데 그전전에 밟은 계단 들중 큰 값
        dp[index][1] = max(dp[index - 2][2] + stair[index], dp[index - 2][1] + stair[index])
        dp[index][2] = dp[index - 1][1] + stair[index]
    }
}

// Output
// 마지막 도착 계단은 반드시 밟아야 한다.
print(dp[count - 1].max()!)
