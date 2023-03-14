let n = Int(readLine()!)!
var map: [[Character]] = []
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]
var answer: Int = 0
var answerR: Int = 0

for _ in 0..<n {
  map.append(Array(readLine()!))
}

for i in 0..<n {
  for j in 0..<n {
    if visited[i][j] { continue }
    visited[i][j] = true
    bfs(i, j)
    answer += 1
  }
}

func bfs(_ r: Int, _ c: Int) {
  var queue: [(r: Int, c: Int)] = [(r, c)]
  var idx: Int = 0
  var char = map[r][c]
  
  while idx < queue.count {
    let cur = queue[idx]
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= n || nc < 0 || nc >= n { continue }
      if visited[nr][nc] { continue }
      if map[nr][nc] != char { continue }
      visited[nr][nc] = true
      queue.append((nr, nc))
    }
    idx += 1
  }
}

visited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
  for j in 0..<n {
    if visited[i][j] { continue }
    visited[i][j] = true
    rbfs(i, j)
    answerR += 1
  }
}

func rbfs(_ r: Int, _ c: Int) {
  var queue: [(r: Int, c: Int)] = [(r, c)]
  var idx: Int = 0
  var char = map[r][c]
  var isB: Bool = char == "B"
  
  while idx < queue.count {
    let cur = queue[idx]
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= n || nc < 0 || nc >= n { continue }
      if visited[nr][nc] { continue }
      if isB {
        if map[nr][nc] == "B" {
          visited[nr][nc] = true
          queue.append((nr, nc))
        }
        else { continue }
      } else {
        if map[nr][nc] == "B" { continue }
        else {
          visited[nr][nc] = true
          queue.append((nr, nc))
        }
      }
    }
    
    idx += 1
  }
}

print(answer, terminator: " ")
print(answerR)
