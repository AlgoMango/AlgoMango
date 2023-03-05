let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let row = input[0]
let col = input[1]
var map = Array(repeating: [Int](), count: row)
var count: Int = 0
var size: Int = 0
var visited = Array(repeating: Array(repeating: false, count: col), count: row)

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]

for i in 0..<row {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  map[i] = line
}

for i in 0..<row {
  for j in 0..<col {
    if map[i][j] == 0 {
      visited[i][j] = true
      continue
    }
    if visited[i][j] { continue }
    count += 1
    bfs(i, j)
  }
}

func bfs(_ r: Int, _ c: Int) {
  visited[r][c] = true
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
      if map[nr][nc] == 0 { continue }
      
      queue.append((nr, nc))
    }
    
    idx += 1
  }
  
  let curSize = queue.count
  if curSize > size { size = curSize }
}

print(count)
print(size)
