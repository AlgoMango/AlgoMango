let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let k = input[1]
let min: Int = 0
let max: Int = 100_000
var answer: Int = Int.max
var visited = Array(repeating: false, count: max + 1)

func bfs() {
  if n == k {
    print(0)
    return
  }
  var queue: [(pos: Int, time: Int)] = [(n, 0)]
  var idx: Int = 0
  
  while idx < queue.count {
    let cur = queue[idx]
    let d = [1, -1, cur.pos]
    
    for i in 0..<3 {
      let new = cur.pos + d[i]
      
      if new == k {
        print(cur.time + 1)
        return
      }
      if new < min || new > max { continue }
      if visited[new] { continue }
      visited[new] = true
      queue.append((new, cur.time + 1))
    }
    
    idx += 1
  }
}

bfs()
