let t = Int(readLine()!)!

for _ in 1...t {
  solve()
}

func solve() {
  let size = readLine()!.split(separator: " ").compactMap { Int($0) }
  let col = size[0]
  let row = size[1]
  let count = size[2]
  
  var map = Array(repeating: Array(repeating: 0, count: col), count: row)
  var answer: Int = 0
  var visited = Array(repeating: Array(repeating: false, count: col), count: row)
  
  let dr = [0, 0, 1, -1]
  let dc = [1, -1, 0, 0]
  
  for _ in 1...count {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let c = input[0]
    let r = input[1]
    map[r][c] = 1
  }
  
  for i in 0..<row {
    for j in 0..<col {
      if visited[i][j] { continue }
      visited[i][j] = true
      if map[i][j] == 1 {
        answer += 1
        bfs(i, j)
      }
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
        
        if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
        if visited[nr][nc] { continue }
        visited[nr][nc] = true
        if map[nr][nc] == 1 { queue.append((nr, nc)) }
      }
      
      idx += 1
    }
  }
  
  print(answer)
}
