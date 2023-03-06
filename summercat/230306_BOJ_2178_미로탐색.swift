// dfs로 풀 경우 모든 경우를 탐색하기 때문에 시간 초과 발생 (메모이제이션 써도 마찬가지)
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let m = input[1]

var map = Array(repeating: [Int](), count: n)
var answer: Int = Int.max

for i in 0..<n {
  let line = Array(readLine()!).compactMap { Int(String($0)) }
  map[i] = line
}

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

func bfs() {
  var queue: [(r: Int, c: Int, depth: Int)] = [(0, 0, 1)]
  var idx: Int = 0
  visited[0][0] = true
  
  while idx < queue.count {
    let cur = queue[idx]
    if cur.r == n - 1 && cur.c == m - 1 {
      answer = cur.depth
      break
    }
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= n || nc < 0 || nc >= m { continue }
      if visited[nr][nc] { continue }
      visited[nr][nc] = true
      
      if map[nr][nc] == 1 {
        queue.append((nr, nc, cur.depth + 1))
      }
    }
    
    idx += 1
  }
}

bfs()
print(answer)
