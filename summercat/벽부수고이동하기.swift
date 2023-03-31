let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let row = size[0]
let col = size[1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: col), count: row)
let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

for _ in 0..<row {
  let line = Array(readLine()!).compactMap { Int(String($0)) }
  map.append(line)
}

func bfs() -> Int {
  let start: (r: Int, c: Int, w: Int) = (0, 0, 0)
  visited[0][0][0] = 1
  var queue: [(r: Int, c: Int, w: Int)] = [start]
  var idx: Int = 0
  
  while idx < queue.count {
    let cur = queue[idx]
    
    if cur.r == row - 1 && cur.c == col - 1 {
      return visited[cur.r][cur.c][cur.w]
    }
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
      if visited[nr][nc][cur.w] != 0 { continue }
      
      // 도달한 칸이 벽이 아닌 경우 -> 벽 부순 여부와 관계없이 + 1
      if map[nr][nc] == 0 {
        visited[nr][nc][cur.w] = visited[cur.r][cur.c][cur.w] + 1
        queue.append((nr, nc, cur.w))
      }
      
      // 도달한 칸이 벽이고, 벽을 부순 적이 없는 경우
      if map[nr][nc] == 1 && cur.w == 0 {
        visited[nr][nc][1] = visited[cur.r][cur.c][cur.w] + 1
        queue.append((nr, nc, 1))
      }
    }
    
    idx += 1
  }
  
  // 목표 지점에 도달하지 못한 경우
  return -1
}

func solve() {
  print(bfs())
}

solve()
