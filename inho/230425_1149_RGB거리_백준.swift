//https://www.acmicpc.net/problem/1149

func solution() {
    let count = Int(readLine()!)!
    var prices: [[Int]] = []
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: count)
    
    for _ in 1...count {
        let houses = readLine()!.split(separator: " ").map { Int(String($0))! }
        prices.append(houses)
    }
    
    dp[0] = prices[0]
    
    for i in 1..<count { //모든 경우의 수에 대한 비용을 조건에 맞게 계산해두기
        dp[i][0] = prices[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = prices[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = prices[i][2] + min(dp[i-1][0], dp[i-1][1])
    }
    
    print(dp[count-1].min()!)
}

solution()
