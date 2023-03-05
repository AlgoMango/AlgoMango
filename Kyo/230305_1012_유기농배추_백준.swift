//230305_1012_유기농배추_백준

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let garo = input[0]
    let sero = input[1]
    let lines = input[2]
    
    var board = Array(repeating: Array(repeating: 0, count: garo), count: sero)
    var visit = Array(repeating: Array(repeating: false, count: garo), count: sero)
    
    var bug = 0
    var queue: [(Int, Int)] = []
    
    // line Input
    for _ in 0..<lines {
        let lineInput = readLine()!.split(separator: " ").map { Int(String($0))! }
        board[lineInput[1]][lineInput[0]] = 1
    }
    
    // BFS
    for y in 0..<sero {
        for x in 0..<garo {
            if visit[y][x] || board[y][x] == 0 { continue }
            queue.append((y, x))
            bug += 1
            
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                for dir in 0..<dx.count {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    if nx < 0 || ny < 0 || nx >= garo || ny >= sero { continue }
                    if visit[ny][nx] { continue }
                    if board[ny][nx] == 0 { continue }
                    
                    queue.append((ny, nx))
                    visit[ny][nx] = true
                }
            }
        }
    }
    
    print(bug)
}
