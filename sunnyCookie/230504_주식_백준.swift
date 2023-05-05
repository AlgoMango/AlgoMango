// https://www.acmicpc.net/problem/11501
// 순방향 -> 시간초과, 주식배열을 뒤집어서사용

let n: Int = Int(readLine()!)!
var answer: [Int] = []

for _ in 0..<n {
    let _ = readLine()
    let prices: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    answer.append(searchMax(prices))
}

func searchMax(_ prices: [Int]) -> Int {
    let reversedPrices: [Int] = prices.reversed()
    var maxPrice: Int = reversedPrices[0]
    var answer: Int = 0

    for i in 1..<reversedPrices.count {
        if reversedPrices[i] > maxPrice {
            maxPrice = reversedPrices[i]
        } else {
            answer += maxPrice - reversedPrices[i]
        }

    }

    return answer
}

answer.forEach { print($0) }
