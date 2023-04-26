//https://www.acmicpc.net/problem/2193
// 풀고보니 피보나치랑 똑같더라~
/*
 3 -> 10 _ -> 0 or 1
 4 -> 10 _ _ -> 1, 0 | 0, 1, | 0, 0
 5 -> 10 _ _ _ -> dp(5) = dp(4) + dp(3)
 */

func solution() {
    guard let number = Int(readLine()!), number > 2 else { return print(1) }
    
    var dp = Array(repeating: 0, count: number+2)
    dp[3] = 2
    dp[4] = 3
    
    for index in 5..<dp.count {
        dp[index] = dp[index-1] + dp[index-2]
    }
    
    print(dp[number])
}

solution()
