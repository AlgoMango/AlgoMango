let input = Array(readLine()!)
var stick: Int = 0
var idx: Int = input.count - 1
var answer: Int = 0

while idx > 0 {
  if input[idx] == ")" {
    if input[idx - 1] == "(" {
      answer += stick
    } else {
      stick += 1
      answer += 1
    }
    idx -= 1
  } else {
    if input[idx + 1] == "(" {
      stick -= 1
    }
    idx -= 1
  }
}

print(answer)
