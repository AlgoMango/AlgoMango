//230318_7562나이트의이동_백준

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let size = Int(readLine()!)!
    let board = Array(repeating: Array(repeating: 0, count: size), count: size)
    var visit = Array(repeating: Array(repeating: -1, count: size), count: size)
    
    let start = readLine()!.split(separator: " ").map { Int(String($0))! }
    let location = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var queue: [(Int, Int)] = []
    
    queue.append((start[0], start[1]))
    visit[start[0]][start[1]] = 0
    
    // BFS 이동 경로
    let dx = [-2, -2, 2, 2, 1, 1, -1, -1]
    let dy = [1, -1, 1, -1, 2, -2, 2, -2]
    
    // BFS
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for dir in 0..<dx.count {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            if ny < 0 || nx < 0 || nx >= size || ny >= size { continue }
            if visit[ny][nx] != -1 { continue }
            visit[ny][nx] = visit[cur.0][cur.1] + 1
            queue.append((ny, nx))
        }
    }
    
    print(visit[location[0]][location[1]])
}
