//230304_1260DFS와BFS_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var n = input[0]
var line = input[1]
var start = input[2]


var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)
// false 면 방문 안한 것

for _ in 0..<line {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[input[0]][input[1]] = 1
    board[input[1]][input[0]] = 1
}

var stack: [Int] = [start]

// DFS
while !stack.isEmpty {
    let cur = stack.removeLast()
    
    if !visited[cur] {
        print(cur, terminator: " ")
    }
    
    visited[cur] = true
    for index in (1..<visited.count).reversed() { // 정점 번호가 작은 것 부터 방문
        if visited[index] { continue }
        if board[cur][index] == 1 {
            stack.append(index)
        }
    }
}

print("\n", terminator: "")

visited = Array(repeating: false, count: n + 1)
visited[start] = true

var queue: [Int] = [start]

// BFS
while !queue.isEmpty {
    let cur = queue.removeFirst()

    print(cur, terminator: " ")
    for index in 1..<visited.count {
        if visited[index] { continue }
        if board[cur][index] == 1 {
            queue.append(index)
            visited[index] = true
        }
    }
}
