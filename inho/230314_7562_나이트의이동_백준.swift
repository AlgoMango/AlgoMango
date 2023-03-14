//https://www.acmicpc.net/problem/7562

func solution() {
    let testCase = Int(readLine()!)!
    let dx = [1, 1, 2, 2, -1, -1, -2, -2], dy = [2, -2, 1, -1, 2, -2, 1, -1] //나이트의 이동 좌표
    
    for _ in 1...testCase {
        let width = Int(readLine()!)!
        let start = readLine()!.split(separator: " ").map { Int(String($0))! }
        let end = readLine()!.split(separator: " ").map { Int(String($0))! }
        var visited = Array(repeating: Array(repeating: false, count: width), count: width)
        
        func bfs() {
            var stack = [(start[0], start[1], 0)]
            
            visited[stack.first!.0][stack.first!.1] = true

            while !stack.isEmpty {
                let node = stack.removeFirst()

                if node.0 == end[0], node.1 == end[1] {
                    print(node.2)
                    break
                }

                for i in 0..<8 {
                    let next = (node.0 + dx[i], node.1 + dy[i], node.2 + 1)

                    if next.0 >= 0 && next.0 < width && next.1 >= 0 && next.1 < width && !visited[next.0][next.1] {
                        visited[next.0][next.1] = true
                        stack.append(next)
                    }
                }
            }
        }
      
        bfs()
    }
}

solution()
