// 이분탐색을 활용한 nlogn은 왜 되는건지 이해를 잘 못하겠음..!

// n <= 200
// n^2 = 40_000
let n = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

// n^2
var max: Int = 1
var dp: [Int] = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if arr[j] < arr[i] && dp[j] + 1 > dp[i] {
            dp[i] = dp[j] + 1
            if max < dp[i] { max = dp[i] }
        }
    }
}

print(n - max)
