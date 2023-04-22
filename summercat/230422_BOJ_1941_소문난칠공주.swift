// 해설 참고했음......

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

var answer: Int = 0
var map = Array(repeating: [Character](), count: 5)
for i in 0..<5 {
  let line = Array(readLine()!)
  map[i] = line
}

// 0~24의 수 중에서 원소의 개수가 7개인 조합을 뽑는다.
// group: 조합을 담고 있는 배열
// depth: 뽑은 칸
func combination(_ group: [(r: Int, c: Int)], _ cur: Int, _ yCount: Int) {
  // 종료조건: depth = 25 또는 group.count == 7 또는 yCount > 3
  if yCount > 3 { return }
  if group.count == 7 {
    // bfs로 인접한지 확인
    if bfs(group) { answer += 1 }
    return
  }
  
  if cur == 25 {
    if group.count != 7 { return }
    // bfs로 인접한지 확인
    if bfs(group) { answer += 1 }
    return
  }
  
  let r = cur / 5
  let c = cur % 5
  if map[r][c] == "Y" {
    combination(group + [(r, c)], cur + 1, yCount + 1)
  } else {
    combination(group + [(r, c)], cur + 1, yCount)
  }
  combination(group, cur + 1, yCount)
}

func bfs(_ coordinates: [(r: Int, c: Int)]) -> Bool {
  var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
  var board = Array(repeating: Array(repeating: 0, count: 5), count: 5)
  
  for coordinate in coordinates {
    board[coordinate.r][coordinate.c] = 1
  }
  
  var queue: [(r: Int, c: Int)] = [coordinates[0]]
  var idx: Int = 0
  
  while idx < queue.count {
    let cur = queue[idx]
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= 5 || nc < 0 || nc >= 5 { continue }
      if visited[nr][nc] || board[nr][nc] == 0 { continue }
      visited[nr][nc] = true
      queue.append((nr, nc))
    }
    
    idx += 1
  }
    
  for coordinate in coordinates {
    if !visited[coordinate.r][coordinate.c] { return false }
  }
  
  return true
}

combination([], 0, 0)
print(answer)
