//230318_7569(높이있는)토마토_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let garo = input[0]
let sero = input[1]
let height = input[2]

let dx = [1, 0, -1, 0, 0, 0]
let dy = [0, 1, 0, -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]

var board: [[[Int]]] = []
var visit: [[[Int]]] = []

var queue: [(Int, Int, Int)] = []

var tomato = 0 // 익은토마토 갯수
var flag = true

for h in 0..<height {
    var temp: [[Int]] = []
    var visitTemp: [[Int]] = []
    for y in 0..<sero {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        temp.append(line)
        
        var visitInit: [Int] = []
        for x in 0..<line.count {
            if line[x] == -1 {
                visitInit.append(-1)    // 벽은 -1
            } else if line[x] == 0 {
                visitInit.append(0)     // 안익은 토마토는 0
            } else {
                tomato += 1             // 익은 토마토 갯수 + 1
                visitInit.append(1)     // 익은 토마토는 1로 하고 큐에 넣기
                queue.append((h, y, x)) // 높이, 세로, 가로 순서
            }
        }
        visitTemp.append(visitInit)
    }
    board.append(temp)
    visit.append(visitTemp)
}

// 시작 전부터 모든 토마토가 익어있는 경우
if tomato == sero * garo {
    print(0)
    flag = false
}

// BFS
var index = 0

while index < queue.count && flag {
    let cur = queue[index]
    index += 1
    for dir in 0..<dx.count {
        let nz = cur.0 + dz[dir]
        let ny = cur.1 + dy[dir]
        let nx = cur.2 + dx[dir]

        if ny < 0 || nx < 0 || nz < 0 || ny >= sero || nx >= garo || nz >= height { continue }
        if visit[nz][ny][nx] != 0 { continue }

        visit[nz][ny][nx] = visit[cur.0][cur.1][cur.2] + 1
        queue.append((nz, ny, nx))
    }
}

let result = visit.flatMap { $0 }.flatMap { $0 }

if flag {
    result.contains(0) ? print(-1) : print(result.max()! - 1)
}
