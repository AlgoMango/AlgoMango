let input = Array(readLine()!)
var stick: Int = 0
var idx: Int = input.count - 1
var answer: Int = 0

while idx > 0 {
  if input[idx] == ")" {
    // ()의 경우 레이저이기 때문에 막대기 개수만큼 답에 더함
    // ))의 경우 막대기 시작(끝)이기 때문에 막대기 개수 + 1, 답 + 1
    if input[idx - 1] == "(" {
      answer += stick
    } else {
      stick += 1
      answer += 1
    }
    idx -= 1
  } else {
    // (( 의 경우 레이저가 아니라 막대기의 끝(시작) 이기 때문에 막대기 개수 - 1
    // () 의 경우 레이저이기 때문에 막대기 개수 변화 x
    if input[idx + 1] == "(" {
      stick -= 1
    }
    idx -= 1
  }
}

print(answer)
