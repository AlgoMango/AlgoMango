var l: Int = 0
var r: Int = 0
var c: Int = 0
var map: [[[Character]]] = []
var visited: [[[Bool]]] = []
var start: (l: Int, r: Int, c: Int, t: Int) = (0, 0, 0, 0)
var answer: Int = 0

func getCase() -> Bool {
  let input = readLine()!.split(separator: " ").compactMap { Int($0) }
  if input == [0, 0, 0] { return false }
  l = input[0]
  r = input[1]
  c = input[2]
  map = Array(repeating: Array(repeating: [Character](), count: r), count: l)
  visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: l)
  answer = 0
  
  for i in 0..<l {
    for j in 0...r {
      let line = Array(readLine()!)
      if j == r { continue }
      map[i][j] = line
      for n in 0..<c {
        if line[n] == "S" { start = (i, j, n, 0) }
      }
    }
  }
  
  solve()
  return true
}

func solve() {
  bfs()
  
  if answer == 0 {
    print("Trapped!")
  } else {
    print("Escaped in \(answer) minute(s).")
  }
}

func bfs() {
  var queue: [(l: Int, r: Int, c: Int, t: Int)] = [start]
  var idx: Int = 0
  
  let dl = [1, -1, 0, 0, 0, 0]
  let dr = [0, 0, 0, 0, 1, -1]
  let dc = [0, 0, 1, -1, 0, 0]
  
  while idx < queue.count {
    let cur = queue[idx]
    
    for i in 0..<6 {
      let nl = cur.l + dl[i]
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nl < 0 || nl >= l || nr < 0 || nr >= r || nc < 0 || nc >= c { continue }
      if visited[nl][nr][nc] { continue }
      visited[nl][nr][nc] = true
      if map[nl][nr][nc] == "#" { continue }
      if map[nl][nr][nc] == "E" {
        answer = cur.t + 1
        return
      }
      queue.append((nl, nr, nc, cur.t + 1))
    }
    
    idx += 1
  }
}

while true {
  if !getCase() { break }
}
