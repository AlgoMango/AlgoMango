let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]
var used = Array(repeating: false, count: n + 1)

func recur(_ cur: Int, _ arr: [Int]) {
  if arr.count == m {
    let line: String = arr.map { String($0) }.joined(separator: " ")
    print(line)
  }
  
  for i in cur...n {
    if used[i] { continue }
    var next: [Int] = arr
    next.append(i)
    used[i] = true
    recur(i, next)
    used[i] = false
  }
}

for i in 1...n {
  used[i] = true
  recur(i, [i])
}
