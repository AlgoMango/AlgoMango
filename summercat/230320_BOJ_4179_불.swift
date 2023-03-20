let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let maxR = size[0]
let maxC = size[1]
var map = Array(repeating: [Int](), count: maxR)
// 0 empty 1 jihun 2 fire 3 wall

var fires: [[(r: Int, c: Int)]] = []
var jihuns: [[(r: Int, c: Int)]] = []
var initialFires: [(r: Int, c: Int)] = []

for i in 0..<maxR {
  let line: [Int] = readLine()!.map { char in
    if char == "#" { return 3 }
    else if char == "F" { return 2 }
    else if char == "J" { return 1 }
    else { return 0 }
  }
  map[i] = line
  
  for j in 0..<maxC {
    if line[j] == 1 {
      jihuns.append([(i, j)])
    }
    if line[j] == 2 {
      initialFires.append((i, j))
    }
  }
}

if initialFires.count > 0 { fires.append(initialFires) }

var time: Int = 0
var answer: Int = Int.max

func solve() {
  // f 확산 후 j 이동
  while true {
//    print(time, fires, jihuns)
    // time = 0, jihuns.count = 1
    // time = 1, jihuns.count = 1
    if time >= jihuns.count { break }
    if fires.count > time { fireBFS() }
    if jihunBFS() { break }
    time += 1
  }
  
  if answer < Int.max { print(answer) }
  else { print("IMPOSSIBLE") }
}

func fireBFS() {
  var idx: Int = 0
  var queue: [(r: Int, c: Int)] = []
  
  while idx < fires[time].count {
    let cur = fires[time][idx]
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= maxR || nc < 0 || nc >= maxC { continue }
      if map[nr][nc] >= 2 { continue }
      map[nr][nc] = 2
      queue.append((nr, nc))
    }
    
    idx += 1
  }
  
  if queue.count > 0 {
    if fires.count == time + 1 { fires.append(queue) }
    else { fires[time + 1].append(contentsOf: queue) }
  }
}

func jihunBFS() -> Bool {
  var idx: Int = 0
  var queue: [(r: Int, c: Int)] = []
  
  while idx < jihuns[time].count {
    let cur = jihuns[time][idx]
    
    for i in 0..<4 {
      let nr = cur.r + dr[i]
      let nc = cur.c + dc[i]
      
      if nr < 0 || nr >= maxR || nc < 0 || nc >= maxC {
        answer = time + 1
        return true
      }
      if map[nr][nc] >= 1 { continue }
      map[nr][nc] = 1
      queue.append((nr, nc))
    }
    
    idx += 1
  }
  
  if queue.count > 0 {
    if jihuns.count == time + 1 { jihuns.append(queue) }
    else { jihuns[time + 1].append(contentsOf: queue) }
  }
  return false
}

solve()
