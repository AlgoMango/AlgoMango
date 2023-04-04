let n = Int(readLine()!)!
var map: [[Int]] = []
var white: Int = 0
var blue: Int = 0

for _ in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  map.append(line)
}

// 주어진 변 크기의 절반씩 나누는 과정 반복
func recur(_ size: Int, _ r: Int, _ c: Int) {
  let color: Int = map[r][c]
  
  if size == 1 {
    if color == 0 { white += 1 }
    else { blue += 1 }
    return
  }
  
  if isSameColor(size, r, c) {
    if color == 0 { white += 1 }
    else { blue += 1 }
    return
  }

  let mr = r + size / 2
  let mc = c + size / 2
  recur(size / 2, r, c)
  recur(size / 2, r, mc)
  recur(size / 2, mr, c)
  recur(size / 2, mr, mc)
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
print(white)
print(blue)
