// 계속 시간초과나서 구글링함..

// 같은 종류가 둘 이상 있을 수 있다.
// 원형 큐
// k개를 연속해서 먹을 경우 할인된 정액 가격으로 제공
// 위 조건을 만족할 경우, 쿠폰의 초밥 무료 제공

// 먹을 수 있는 초밥 '가짓수'의 최대

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
// 접시의 수
let n = input[0]
// 초밥 가짓수
let d = input[1]
// 연속해서 먹는 개수
let k = input[2]
// 쿠폰 번호
let c = input[3]

var dishes: [Int] = []
for _ in 0..<n {
  let dish = Int(readLine()!)!
  dishes.append(dish)
}

var visited = Array(repeating: 0, count: d + 1)
var answer: Int = 0

func solve() -> Int {
  var count: Int = 0
  var chance: Int = 0
  for i in 0..<k {
    if visited[dishes[i]] == 0 { count += 1 }
    visited[dishes[i]] += 1
  }
  chance = count
  
  for i in 0..<n {
    // 이전 슬라이드에서의 count가 chance보다 작으면 넘어간다
    if chance <= count {
      // 쿠폰 안 쓴 경우 +1
      if visited[c] == 0 { chance = count + 1 }
      else { chance = count }
    }
    visited[dishes[i]] -= 1
    if visited[dishes[i]] == 0 { count -= 1 }
    if visited[dishes[(i + k) % n]] == 0 { count += 1 }
    visited[dishes[(i + k) % n]] += 1
  }
  
  return chance
}

print(solve())
