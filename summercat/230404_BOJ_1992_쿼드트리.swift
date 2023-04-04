let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var answer: String = ""

for i in 0..<n {
  let line: [Int] = Array(readLine()!).compactMap { Int(String($0)) }
  map[i] = line
}

func recur(_ size: Int, _ r: Int, _ c: Int) {
  if size == 1 {
    answer.append(String(map[r][c]))
    return
  }
  
  if isSameColor(size, r, c) {
    answer.append(String(map[r][c]))
    return
  }
  
  let mr = r + size / 2
  let mc = c + size / 2
  answer.append("(")
  recur(size / 2, r, c)
  recur(size / 2, r, mc)
  recur(size / 2, mr, c)
  recur(size / 2, mr, mc)
  answer.append(")")
}

func isSameColor(_ size: Int, _ r: Int, _ c: Int) -> Bool {
  let color: Int = map[r][c]
  
  for i in r..<r + size {
    for j in c..<c + size {
      if map[i][j] != color { return false }
    }
  }
  
  return true
}

recur(n, 0, 0)
print(answer)
