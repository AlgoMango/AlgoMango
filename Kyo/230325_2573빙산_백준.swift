//230325_2573빙산_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let sero = input[0]
let garo = input[1]

var board: [[Int]] = []
var visit: [[Int]] = []

var queue: [(Int, Int)] = []
var tempQueue: [(Int, Int)] = []

for y in 0..<sero {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
    
    var temp: [Int] = []
    for x in 0..<garo {
        if input[x] == 0 {
            temp.append(-1)
        } else {
            temp.append(0)
            queue.append((y, x))
        }
    }
    
    visit.append(temp)
}

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

// 초기 셋팅
tempQueue = queue
var bing = 0
var answer = 0
var tempBoard = board

while checkBing(sero: sero, garo: garo, bings: tempBoard) < 2 {
    if board.flatMap { $0 }.max() == .zero {
        answer = 0
        break
    }
    
    // 한바퀴 모두 돌면 아래 4개 실행
    answer += 1
    queue = tempQueue
    board = tempBoard
    tempQueue.removeAll()
    
    var index = 0
    while index < queue.count { // 빙산 한 바퀴
        let cur = queue[index]
        index += 1
        var cnt = 0
        for dir in 0..<dx.count {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            
            if nx < 0 || ny < 0 || nx >= garo || ny >= sero { continue }
            if board[ny][nx] == 0 {
                cnt += 1
            }
        }
        
        if board[cur.0][cur.1] - cnt > 0 {
            tempBoard[cur.0][cur.1] = board[cur.0][cur.1] - cnt // 현재 보드에 반영하면 안되고 다음 보드에 반영해야한다.
            tempQueue.append((cur.0, cur.1))
        } else {
            tempBoard[cur.0][cur.1] = 0
        }
    }
}

print(answer)

// 빙산 덩어리가 몇개인지 Check
func checkBing(sero: Int, garo: Int, bings: [[Int]]) -> Int {
    var visit = Array(repeating: Array(repeating: 0, count: garo), count: sero)
    var bingQueue: [(Int, Int)] = []
    var bing = 0
    
    for y in 0..<sero {
        for x in 0..<garo {
            if bings[y][x] > 0 && visit[y][x] == 0 {
                bingQueue.append((y, x))
                visit[y][x] = 1
                bing += 1
            } else {
                continue
            }
                
            var index = 0
            while index < bingQueue.count {
                let cur = bingQueue[index]
                index += 1
                for dir in 0..<dx.count {
                    let ny = dy[dir] + cur.0
                    let nx = dx[dir] + cur.1
                    if nx < 0 || ny < 0 || ny >= sero || nx >= garo { continue }
                    if bings[ny][nx] == 0 || visit[ny][nx] != 0  { continue }
                    visit[ny][nx] = 1
                    bingQueue.append((ny, nx))
                }
            } // while
        }
    }
    
    return bing
}
