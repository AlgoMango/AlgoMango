// 재귀
var numbersCopy: [Int] = []
var max: Int = 0
var targetSum: Int = 0
var answer: Int = 0

func solution(_ numbers: [Int], _ target: Int) -> Int {
  numbersCopy = numbers
  max = numbers.count
  targetSum = target
  
  recur(0, 0)
  
  print(answer)
  return answer
}

func recur(_ idx: Int, _ cur: Int) {
  if idx == max {
    if cur == targetSum {
      answer += 1
      return
    }
    else { return }
  }
  
  // 현재 idx 값을 더하거나 빼거나
  // print(idx, cur)
  recur(idx + 1, cur + numbersCopy[idx])
  recur(idx + 1, cur - numbersCopy[idx])
}
