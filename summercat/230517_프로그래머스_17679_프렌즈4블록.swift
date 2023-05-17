// 계속 테케 11번만 오류 뜨는데 어디가 문제인지 찾아주실분?ㅠㅠ

let dr: [Int] = [0, 1, 1]
let dc: [Int] = [1, 0, 1]
var map: [[Character]] = []
var removed: [[Bool]] = []
var maxR: Int = 0
var maxC: Int = 0
var answer: Int = 0

// m: row, n: col
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
  maxR = m
  maxC = n
  
  for str in board {
    map.append(Array(str))
  }
  
  while true {
    var toRemove: [(r: Int, c: Int)] = []
    removed = Array(repeating: Array(repeating: false, count: n), count: m)
    // 블록 제거
    for i in 0..<m {
      for j in 0..<n {
        if map[i][j] == "0" { continue }
        let removeTargets = check(i, j)
        toRemove.append(contentsOf: removeTargets)
      }
    }
    
    if toRemove.count == 0 { break }
    removeBlocks(toRemove)
    
    for i in (0..<m).reversed() {
      for j in (0..<n).reversed() {
        if map[i][j] != "0" { continue }
        fall(i, j)
      }
    }
  }
  
  return answer
}

func check(_ r: Int, _ c: Int) -> [(r: Int, c: Int)] {
  var blocks: [(r: Int, c: Int)] = []
  let target = map[r][c]
  
  if !removed[r][c] {
    blocks.append((r, c))
    removed[r][c] = true
  }
  
  for i in 0..<3 {
    let nr = r + dr[i]
    let nc = c + dc[i]
    
    if nr < 0 || nr >= maxR || nc < 0 || nc >= maxC { return [] }
    if map[nr][nc] != target { return [] }
    if removed[nr][nc] { continue }
    blocks.append((nr, nc))
    removed[nr][nc] = true
  }
  
  return blocks
}

func removeBlocks(_ blocks: [(r: Int, c: Int)]) {
  for block in blocks {
    map[block.r][block.c] = "0"
    answer += 1
  }
}

func fall(_ r: Int, _ c: Int) {
  for i in (0..<r).reversed() {
    if map[i][c] != "0" {
      map[r][c] = map[i][c]
      map[i][c] = "0"
      return
    }
  }
}
