//230320_4179불!_백준

let line = readLine()!.split(separator: " ").map { Int(String($0))! }

var sero = line[0]
var garo = line[1]

var board: [[String]] = []

var visit: [[Int]] = []
var fireVisit: [[Int]] = []

var runQueue: [(Int, Int)] = []
var fireQueue: [(Int, Int)] = []

for y in 0..<sero {
    let input = readLine()!.map { String($0) }
    board.append(input)
    
    var tempVisit: [Int] = []
    var tempFireVisit: [Int] = []
    
    for x in 0..<input.count {
        if input[x] == "#" {
            tempVisit.append(-1)
            tempFireVisit.append(-1)
        } else if input[x] == "." {
            tempVisit.append(0)
            tempFireVisit.append(0)
        } else if input[x] == "J" {
            tempVisit.append(1)
            tempFireVisit.append(0)
            runQueue.append((y, x))
        } else if input[x] == "F"{
            tempVisit.append(-1)
            tempFireVisit.append(1)
            fireQueue.append((y, x))
        }
    }
    
    visit.append(tempVisit)
    fireVisit.append(tempFireVisit)
}

let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

// 불 경로
var index = 0
while index < fireQueue.count {
    let cur = fireQueue[index]
    index += 1
    
    for dir in 0..<dx.count {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]
        if ny < 0 || nx < 0 || ny >= sero || nx >= garo { continue }
        if fireVisit[ny][nx] != 0 { continue }
        fireQueue.append((ny, nx))
        fireVisit[ny][nx] = fireVisit[cur.0][cur.1] + 1
    }
}


var answer = sero * garo + 1 // + 1인 이유 : 1 1 J 때문에..
index = 0

// 도망 경로
while index < runQueue.count {
    let cur = runQueue[index]
    index += 1
    
    if cur.1 == 0 || cur.1 == garo - 1 || cur.0 == 0 || cur.0 == sero - 1 {
        answer = visit[cur.0][cur.1]
        break
    }
    
    for dir in 0..<dx.count {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]
        if ny < 0 || nx < 0 || ny >= sero || nx >= garo { continue }
        if visit[ny][nx] != 0 || board[ny][nx] != "." { continue } // 이미 방문했거나 벽 혹은 불이면
        if visit[cur.0][cur.1] + 1 >= fireVisit[ny][nx] && fireVisit[ny][nx] != 0 { continue } // 불보다 느릴 경우
        
        visit[ny][nx] = visit[cur.0][cur.1] + 1
        
        if nx == 0 || nx == garo - 1 || ny == 0 || ny == sero - 1 {
            if answer > visit[ny][nx] {
                answer = visit[ny][nx]
            }
        }
        
        runQueue.append((ny, nx))
    }
}

answer == sero * garo + 1 ? print("IMPOSSIBLE") : print(answer)
