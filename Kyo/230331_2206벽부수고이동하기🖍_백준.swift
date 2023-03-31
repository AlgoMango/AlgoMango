//230331_2206벽부수고이동하기_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let sero = input[0]
let garo = input[1]

var board: [[String]] = []
var visit: [[[Int]]] = Array(
    repeating: Array(
        repeating: Array(repeating: 0, count: garo),
        count: sero
    ),
    count: 2
)
// 벽 여부, 세로, 높이


var visitTemp: [[Int]] = []
for _ in 0..<sero {
    let line = readLine()!.map { String($0) }
    board.append(line)
}

var queue: [(Int, Int, Int)] = [] // 벽 여부, 세로, 높이

// 시작 지점
if board[0][0] == "0" {
    queue.append((0, 0, 0))
    visit[0][0][0] = 1
} else {
    queue.append((1, 0, 0))
    visit[1][0][0] = 1
}

// 방향
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var answer = 0
var flag = false

var queueIndex = 0
while queueIndex < queue.count {
    let cur = queue[queueIndex]
    queueIndex += 1
    
    // 보드의 마지막이면 break
    if cur.1 == sero - 1 && cur.2 == garo - 1 {
        answer = visit[cur.0][cur.1][cur.2]
        flag = true
        break
    }
    
    for dir in 0..<dx.count {
        let ny = cur.1 + dy[dir]
        let nx = cur.2 + dx[dir]
        
        if ny < 0 || nx < 0 || ny >= sero || nx >= garo { continue }
        if visit[cur.0][ny][nx] != 0 { continue }
        
        if board[ny][nx] == "0" {
            visit[cur.0][ny][nx] = visit[cur.0][cur.1][cur.2] + 1
            queue.append((cur.0, ny, nx))
        } else if board[ny][nx] == "1" && cur.0 == 0 {
            visit[1][ny][nx] = visit[cur.0][cur.1][cur.2] + 1
            queue.append((1, ny, nx))
        } // 보드가 1인데 벽을 이미 부순 경우는 continue된다.
    }
}

if flag {
    print(answer)
} else {
    print("-1")
}
