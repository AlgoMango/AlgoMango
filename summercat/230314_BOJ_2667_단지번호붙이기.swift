let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]
var answers: [Int] = []

for i in 0..<n {
  let line = Array(readLine()!)
  map[i] = line.compactMap { Int(String($0)) }
}

for i in 0..<n {
  for j in 0..<n {
    if visited[i][j] { continue }
    visited[i][j] = true
    if map[i][j] == 0 { continue }
    bfs(i, j)
  }
}

func bfs(_ r: Int, _ c: Int) {
  var queue: [(r: Int, c: Int)] = [(r, c)]
  var idx: Int = 0
  
  while idx < queue.count {
    let cur = queue[idx]
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= n || nc < 0 || nc >= n { continue }
      if visited[nr][nc] { continue }
      visited[nr][nc] = true
      if map[nr][nc] == 0 { continue }
      queue.append((nr, nc))
    }
    idx += 1
  }
  
  answers.append(queue.count)
}

print(answers.count)

if answers.count > 0 {
  answers.sort(by: <)
}

answers.forEach { print($0) }
