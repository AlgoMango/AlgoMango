//230306_7576토마토_백준
// removeFirst() 시간초과 발생하여 index로 요소 접근 

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let garo = input[0]
let sero = input[1]

var board: [[Int]] = []
var visit: [[Int]] = Array(repeating: Array(repeating: 0, count: garo), count: sero)

for _ in 0..<sero {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! } )
}

var queue: [(Int, Int)] = []

// 안익은 토마토는 visit 배열에서 0, 익은 토마토는 1, 안들어있는 칸은 -1로 셋팅
for y in 0..<sero {
    for x in 0..<garo {
        if board[y][x] == 1 {
            queue.append((y, x))
            visit[y][x] = 1
        } else if board[y][x] == -1 {
            visit[y][x] = -1
        }
    }
}

// BFS
var index = 0
while index != queue.count {
//    let cur = queue.removeFirst() // 여기서 시간초과 발생 -> index로 접근
    let cur = queue[index]
    index += 1                      // index 1개씩 상승
    for dir in 0..<dx.count {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]
        
        if nx < 0 || ny < 0 || nx >= garo || ny >= sero { continue }
        if board[ny][nx] == -1 || visit[ny][nx] > 0 { continue }
        queue.append((ny, nx))
        visit[ny][nx] = visit[cur.0][cur.1] + 1
    }
}

// 0(안익은 토마토)가 있다면 -1
// -1 하는 이유 : 처음에 1부터 시작하기 때문
let result = visit.flatMap { $0 }.contains(0) ? -1 : visit.flatMap { $0 }.max()! - 1
print(result)
