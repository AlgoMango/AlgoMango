//230311_10026적록색약_백준

let line = Int(readLine()!)!

var board: [[String]] = []
var visit: [[Bool]] = []

for _ in 0..<line {
    var input = readLine()!.map { String($0) }
    
    board.append(input)
    visit.append(Array(repeating: false, count: line))
}

let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

var queue: [(Int, Int)] = []

// 적록색약 아닌 사람
var normalCount = 0
for sero in 0..<line {
    for garo in 0..<line {
        if visit[sero][garo] { continue }
        queue.append((sero, garo))
        visit[sero][garo] = true
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for dir in 0..<dx.count {
                let ny = cur.0 + dy[dir]
                let nx = cur.1 + dx[dir]
                
                if ny < 0 || nx < 0 || ny >= line || nx >= line { continue }
                if visit[ny][nx] { continue }
                if board[ny][nx] != board[cur.0][cur.1] { continue }
                visit[ny][nx] = true
                queue.append((ny, nx))
            }
        }
        normalCount += 1
    }
}

visit = Array(repeating: Array(repeating: false, count: line), count: line)

// 적록색약인 사람
var jaejunCount = 0
for sero in 0..<line {
    for garo in 0..<line {
        if visit[sero][garo] { continue }
        queue.append((sero, garo))
        visit[sero][garo] = true
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for dir in 0..<dx.count {
                let ny = cur.0 + dy[dir]
                let nx = cur.1 + dx[dir]
                
                if ny < 0 || nx < 0 || ny >= line || nx >= line { continue }
                if visit[ny][nx] { continue }
                
                if board[cur.0][cur.1] == "R" || board[cur.0][cur.1] == "G" {
                    if board[ny][nx] == "B" { continue }
                    visit[ny][nx] = true
                    queue.append((ny, nx))
                } else {
                    if board[ny][nx] != board[cur.0][cur.1] { continue }
                    visit[ny][nx] = true
                    queue.append((ny, nx))
                }
            }
        }
        jaejunCount += 1
    }
}

print(normalCount, jaejunCount)
