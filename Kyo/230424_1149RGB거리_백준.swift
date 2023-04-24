//230424_1149RGB거리_백준
let count = Int(readLine()!)!

var array: [[Int]] = []

for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    array.append(input)
}

/*
 26 40 83
 49 60 57
 13 89 99
 */

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: count)
/*
 dp[K][1] = K번쨰 집까지 칠했고, K번쨰 집에서 1번을 선택했다.
 */

dp[0][0] = array[0][0]
dp[0][1] = array[0][1]
dp[0][2] = array[0][2]

for index in 1..<array.count {
    dp[index][0] = min(dp[index - 1][1], dp[index - 1][2]) + array[index][0]
    dp[index][1] = min(dp[index - 1][0], dp[index - 1][2]) + array[index][1]
    dp[index][2] = min(dp[index - 1][0], dp[index - 1][1]) + array[index][2]
}

print(dp[count - 1].flatMap { $0 }.min()!)
