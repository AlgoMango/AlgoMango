let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var used = Array(repeating: false, count: n + 1)
var answer: String = ""

func recur(_ arr: [Int]) {
  if arr.count == m {
    var line: String = arr.map { String($0) }.joined(separator: " ")
    line.append("\n")
    answer += line
    return
  }
  
  for i in 1...n {
    var next: [Int] = arr
    next.append(i)
    recur(next)
  }
}

for i in 1...n {
  recur([i])
}

answer.removeLast()
print(answer)
