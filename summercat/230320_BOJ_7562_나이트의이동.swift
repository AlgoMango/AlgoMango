let cases = Int(readLine()!)!
let dr = [-2, -2, -1, -1, 1, 1, 2, 2]
let dc = [-1, 1, -2, 2, -2, 2, -1, 1]
var visited: [[Bool]] = []

func solve() {
  let size = Int(readLine()!)!
  let cur = readLine()!.split(separator: " ").compactMap { Int($0) }
  let target = readLine()!.split(separator: " ").compactMap { Int($0) }
  visited = Array(repeating: Array(repeating: false, count: size), count: size)
  bfs((cur[0], cur[1]), target: (target[0], target[1]), size: size)
}

func bfs(_ start: (r: Int, c: Int), target: (r: Int, c: Int), size: Int) {
  var queue: [(r: Int, c: Int, count: Int)] = [(start.r, start.c, 0)]
  var idx: Int = 0
  visited[start.r][start.c] = true
  
  if start.r == target.r && start.c == target.c {
    print(0)
    return
  }
  
  while idx < queue.count {
    let cur = queue[idx]
    
    for i in 0..<8 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= size || nc < 0 || nc >= size { continue }
      if visited[nr][nc] { continue }
      if nr == target.r && nc == target.c {
        print(cur.count + 1)
        return
      }
      visited[nr][nc] = true
      queue.append((nr, nc, cur.count + 1))
    }
    
    idx += 1
  }
}

for _ in 0..<cases {
  solve()
}
