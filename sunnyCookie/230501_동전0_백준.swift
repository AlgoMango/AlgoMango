// https://www.acmicpc.net/problem/11047


let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, goalMoney) = (input[0], input[1])
var coins: [Int] = [1]
var count: [Int] = [0]

for _ in 0..<n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

func countCoin(_ money: Int) -> Int {
    var totalCount: Int = money/coins[1]

    for i in 1..<coins.count {
        guard money >= coins[i] else { break }

        let multiple = coins[i]/coins[i-1]
        let max = money/coins[i]
        let remain = totalCount - (max*multiple)

        count.append(max)
        totalCount = max + remain
    }

    return totalCount
}

print(countCoin(goalMoney))
