//230305_2178_미로탐색_백준

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let sero = input[0]
let garo = input[1]

var board: [[Int]] = []
var visit: [[Bool]] = []

for _ in 0..<sero {
    let line = readLine()!.map { Int(String($0))! }
    board.append(line)
    visit.append(Array(repeating: false, count: garo))
}

var queue: [(Int, Int)] = []

// BFS
for y in 0..<sero {
    for x in 0..<garo {
        if board[y][x] == 0 || visit[y][x] { continue }
        queue.append((y, x))
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for dir in 0..<dx.count {
                let ny = cur.0 + dy[dir]
                let nx = cur.1 + dx[dir]
                
                if nx < 0 || ny < 0 || nx >= garo || ny >= sero { continue }
                if visit[ny][nx] || board[ny][nx] != 1 { continue }
                queue.append((ny, nx))
                visit[ny][nx] = true
                board[ny][nx] = board[cur.0][cur.1] + 1  // 경로마다 1을 더 해줌
            }
        }
    }
}

print(board[sero - 1][garo - 1])
