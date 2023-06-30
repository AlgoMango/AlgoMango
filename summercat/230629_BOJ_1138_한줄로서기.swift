// 30분.. 실화?

// n명의 사람, 키는 모두 다르다 (1~n)
// 자기보다 큰 사람이 왼쪽에 몇명 있었는지만 기억
// 키가 1인사람부터 자기보다 큰 사람이 왼쪽에 몇 명 있었는지

let n: Int = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var answer: [Int] = Array(repeating: 0, count: n)

for i in 0..<n {
  var emptyCount: Int = 0
  var idx: Int = 0
  let bigger = arr[i]
  
  while true {
    if emptyCount == bigger {
      if answer[idx] == 0 {
        answer[idx] = i + 1
        break
      }
    }
    if answer[idx] == 0 { emptyCount += 1 }
    idx += 1
  }
}

print(answer.map { String($0) }.joined(separator: " "))
