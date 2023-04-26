//https://www.acmicpc.net/problem/1912
/*
 입력 2 1 -4 3 4 -4 6  5 -5 1
 dp  2 3 -1 3 7  3 9 14  9 8
*/

func solution() {
    let count = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = Array(repeating: 0, count: count)
    dp[0] = numbers[0]
    
    for index in 1..<count {
        dp[index] = max(numbers[index], dp[index-1] + numbers[index])
    }

    print(dp.max()!)
}

solution()
