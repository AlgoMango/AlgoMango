// 20분

let cityCount: Int = Int(readLine()!)!
let distances: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let prices: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var answer: Int = 0
var minPrice: Int = prices[0]

// 첫번째 가격 = 최소 가격으로 기억
// 처음에는 무조건 거리만큼 삼
// 두 번째 가격부터는 최소 가격과 현재 가격을 비교해서 최소인쪽으로 거리만큼 삼
// 현재 가격이 더 쌀 경우 최소 가격 업데이트
func solve() {
  for i in 0..<distances.count {
    if prices[i] < minPrice { minPrice = prices[i] }
    answer += distances[i] * minPrice
  }
  
  print(answer)
}

solve()
