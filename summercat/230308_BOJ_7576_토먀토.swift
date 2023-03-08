// day가 바뀔때마다 0,0부터 탐색하면 시간초과
// 엣지케이스 고려 필요
// 1. 익은 토마토가 아예 안들어 있는 경우
// 2. 전부 익은 토마토인 경우

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let col = input[0]
let row = input[1]

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

var map = Array(repeating: [Int](), count: row)
var queue: [(r: Int, c: Int, d: Int)] = []
for i in 0..<row {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  for j in 0..<col {
    if line[j] == 1 { queue.append((i, j, 0))}
  }
  map[i] = line
}

var idx: Int = 0
var answer: Int = 0

func solve() -> Int {
  if queue.count == col * row {
    return 0
  } else {
    while idx < queue.count {
      let cur = queue[idx]
      bfs(cur.r , cur.c, cur.d)
      idx += 1
    }
  }
  
  for i in 0..<row {
    for j in 0..<col {
      if map[i][j] == 0 {
        return -1
      }
    }
  }
  
  answer = queue.last!.d
  return answer
}

func bfs(_ r: Int, _ c: Int, _ d: Int) {
  for i in 0..<4 {
    let nr = r + dr[i]
    let nc = c + dc[i]
    
    if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
    if map[nr][nc] == 0 {
      map[nr][nc] = d + 1
      queue.append((nr, nc, d + 1))
    }
  }
}

print(solve())
