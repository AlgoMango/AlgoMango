//230314_2667단지번호붙이기_백준

let line = Int(readLine()!)!

var board: [[Int]] = []
var visit: [[Bool]] = []

for _ in 0..<line {
    let input = readLine()!.map { Int(String($0))! }
    board.append(input)
    visit.append(Array(repeating: false, count: line))
}

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var queue: [(Int, Int)] = []
var result: [Int] = []

var villiage = 0

for sero in 0..<line {
    for garo in 0..<line {
        if visit[sero][garo] { continue }
        if board[sero][garo] == 0 { continue }
        
        var cnt = 1
        villiage += 1
        visit[sero][garo] = true
        queue.append((sero, garo))
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for dir in 0..<4 {
                let ny = cur.0 + dy[dir]
                let nx = cur.1 + dx[dir]
                
                if nx < 0 || ny < 0 || nx >= line || ny >= line { continue }
                if visit[ny][nx] || board[ny][nx] == 0 { continue }
                visit[ny][nx] = true
                queue.append((ny, nx))
                cnt += 1
            }
        }
        result.append(cnt)
    }
}

print(villiage)
result.sorted(by: <).forEach{ print($0) }
