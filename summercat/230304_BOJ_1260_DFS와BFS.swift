let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0] // 정점의 개수
let m = input[1] // 간선의 개수
let v = input[2] // 탐색 시작
var map: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for _ in 1...m {
  let line = readLine()!.split(separator: " ").compactMap { Int($0) }
  let from = line[0]
  let to = line[1]
  
  map[from][to] = 1
  map[to][from] = 1
}

var dfsResult: [Int] = []
var visited = Array(repeating: false, count: n + 1)
func dfs(_ node: Int) {
  dfsResult.append(node)
  visited[node] = true
  
  for i in 1...n {
    let cur = map[node][i]
    if visited[i] { continue }
    if cur == 1 { dfs(i) }
  }
}

func bfs(_ node: Int) {
  var queue: [Int] = [node]
  var bfsVisited = Array(repeating: false, count: n + 1)
  bfsVisited[node] = true
  var idx: Int = 0 // 큐에서의 현재 위치
  
  while idx < queue.count {
    let cur = queue[idx]
    for i in 1...n {
      if map[cur][i] == 1 && !bfsVisited[i] {
        queue.append(i)
        bfsVisited[i] = true
      }
    }
    idx += 1
  }
  
  let bfsAnswer = queue.map { String($0) }.joined(separator: " ")
  print(bfsAnswer)
}

dfs(v)
let dfsAnswer = dfsResult.map { String($0) }.joined(separator: " ")
print(dfsAnswer)

bfs(v)
