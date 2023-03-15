let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var min: Int = Int.max
var max: Int = 0
var answer: Int = 0
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  map[i] = line
  for i in 0..<n {
    if line[i] < min { min = line[i] }
    if line[i] > max { max = line[i] }
  }
}

func solve() {
  for i in min...max {
    let rain = i
    var cur: Int = 0
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for m in 0..<n {
      for n in 0..<n {
        if visited[m][n] { continue }
        visited[m][n] = true
        if map[m][n] <= rain { continue }
        bfs(m, n, rain)
        cur += 1
      }
    }
    if cur > answer { answer = cur }
  }

  answer = answer == 0 ? 1 : answer
  print(answer)
}

func bfs(_ r: Int, _ c: Int, _ rain: Int) {
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
      if map[nr][nc] <= rain { continue }
      queue.append((nr, nc))
    }
    
    idx += 1
  }
}

solve()
