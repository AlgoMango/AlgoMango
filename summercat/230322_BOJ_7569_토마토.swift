let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let col = input[0]
let row = input[1]
let h = input[2]
var map = Array(repeating: Array(repeating: [Int](),count: row), count: h)
var ripe: [(h: Int, r: Int, c: Int, t: Int)] = []
var count: Int = 0
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: col), count: row), count: h)

// 토마토가 1개 이상 반드시 존재
// 1 익은토마토 0 익지않은토마토 -1 빈칸

for i in 0..<h {
  for j in 0..<row {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    map[i][j] = line
    
    for k in 0..<line.count {
      if line[k] == 0 { count += 1 }
      if line[k] == 1 {
        ripe.append((i, j, k, 0))
        visited[i][j][k] = true
      }
      if line[k] == -1 { visited[i][j][k] = true }
    }
  }
}

func solve() {
  if count == 0 {
    print(0)
    return
  }
  
  bfs()
}

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]
let dh = [1, -1]

func bfs() {
  var queue = ripe
  var idx: Int = 0
  
  while idx < queue.count {
    if count == 0 {
      print(queue.last!.t)
      return
    }
    
    let cur = queue[idx]
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
      if visited[cur.h][nr][nc] { continue }
      visited[cur.h][nr][nc] = true
      map[cur.h][nr][nc] = 1
      count -= 1
      queue.append((cur.h, nr, nc, cur.t + 1))
    }
    
    for i in 0..<2 {
      let nh = cur.h + dh[i]
      
      if nh < 0 || nh >= h { continue }
      if visited[nh][cur.r][cur.c] { continue }
      visited[nh][cur.r][cur.c] = true
      map[nh][cur.r][cur.c] = 1
      count -= 1
      queue.append((nh, cur.r, cur.c, cur.t + 1))
    }
    
    idx += 1
  }
  
  if count > 0 { print(-1) }
}

solve()
