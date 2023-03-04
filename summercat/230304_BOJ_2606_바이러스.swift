let node = Int(readLine()!)! // 컴퓨터의 수
let edge = Int(readLine()!)! // 간선의 수
var map = Array(repeating: [Int](), count: node + 1)

for _ in 1...edge {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  let from = line[0]
  let to = line[1]
  
  map[from].append(to)
  map[to].append(from)
}

var queue: [Int] = []
func bfs(_ start: Int) {
  queue.append(start)
  var visited = Array(repeating: false, count: node + 1)
  visited[start] = true
  var idx: Int = 0
  
  while idx < queue.count {
    let cur = queue[idx]
    for item in map[cur] {
      if visited[item] { continue }
      queue.append(item)
      visited[item] = true
    }
    idx += 1
  }
}

bfs(1)
print(queue.count - 1)
