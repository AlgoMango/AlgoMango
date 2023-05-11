let houseCount = Int(readLine()!)!
// R G B
var costs: [[Int]] = []

for _ in 0..<houseCount {
  let cost = readLine()!.split(separator: " ").compactMap { Int($0) }
  costs.append(cost)
}

func solve() {
  // (R, G, B)
  var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: houseCount)
  dp[0] = [costs[0][0], costs[0][1], costs[0][2]]
  
  for i in 1..<houseCount {
    dp[i][0] = costs[i][0] + min(dp[i - 1][1], dp[i - 1][2])
    dp[i][1] = costs[i][1] + min(dp[i - 1][0], dp[i - 1][2])
    dp[i][2] = costs[i][2] + min(dp[i - 1][0], dp[i - 1][1])
  }
    
  print(min(dp[houseCount - 1][0], dp[houseCount - 1][1], dp[houseCount - 1][2]))
}

solve()
