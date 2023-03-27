let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let row = size[0]
let col = size[1]
var map: [[Int]] = []
var mapCopy: [[Int]] = []
let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]
var countVisit = Array(repeating: Array(repeating: false, count: col), count: row)

for _ in 0..<row {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  map.append(line)
}

func countIce() -> Int {
  var count: Int = 0
  countVisit = Array(repeating: Array(repeating: false, count: col), count: row)
  
  for i in 0..<row {
    for j in 0..<col {
      if countVisit[i][j] { continue }
      countVisit[i][j] = true
      if map[i][j] == 0 { continue }
      bfs(i, j)
      count += 1
    }
  }
  
  return count
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
      if countVisit[nr][nc] { continue }
      countVisit[nr][nc] = true
      if map[nr][nc] == 0 { continue }
      queue.append((nr, nc))
    }
    
    idx += 1
  }
}

func melt(_ r: Int, _ c: Int) {
  var waterCount: Int = 0
  
  for i in 0..<4 {
    let nr = r + dr[i]
    let nc = c + dc[i]
    
    if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
    if map[nr][nc] == 0 { waterCount += 1 }
  }
  
  if map[r][c] - waterCount < 0 { mapCopy[r][c] = 0 }
  else { mapCopy[r][c] = map[r][c] - waterCount }
}

func solve() {
  var count: Int = 0
  var year: Int = 0
  mapCopy = map
  
  while true {
    year += 1
    for i in 0..<row {
      for j in 0..<col {
        if map[i][j] == 0 { continue }
        melt(i, j)
      }
    }
    
    map = mapCopy
    count = countIce()
    if count != 1 { break }
  }
  
  if count == 0 { print(0) }
  else { print(year) }
}

solve()
