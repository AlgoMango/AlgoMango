//230627_2573빙산_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var sero = input[0]
var garo = input[1]

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

var board: [[Int]] = []

for _ in 0..<sero {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: garo), count: sero)

var queue: [(Int, Int)] = []
var year = 0
var count = 0

while true {
    if Set(board.flatMap { $0 }) == [0] {
        break
    }
    
    count = 0
    for indexS in 0..<sero {
        for indexG in 0..<garo {
            if visit[indexS][indexG] { continue }
            if board[indexS][indexG] == 0 { continue }
            visit[indexS][indexG] = true
            queue.removeAll()
            queue.append((indexS, indexG))
            count += 1
            var index = 0
            while index < queue.count {
                let cur = queue[index]
                index += 1
                
                for dir in 0..<dx.count {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    
                    if ny < 0 || nx < 0 || ny >= sero || nx >= garo { continue }
                    if visit[ny][nx] { continue }
                    if board[ny][nx] == 0 { continue }
                    visit[ny][nx] = true
                    queue.append((ny, nx))
                }
            }
        }
    }
    
    if count < 2 {
        board = updateBoard(board)
        visit = Array(repeating: Array(repeating: false, count: garo), count: sero)
    } else {
        break
    }
}
 
// Output
print(count < 2 ? 0 : year)

//  한번실행시 -1년
func updateBoard(_ board: [[Int]]) -> [[Int]] {
    year += 1
    var tempBoard = board
    var tempVisit: [[Bool]] = Array(repeating: Array(repeating: false, count: garo), count: sero)
    
    for indexS in 0..<sero {
        for indexG in 0..<garo {
            if tempBoard[indexS][indexG] == 0 { continue }
            if tempVisit[indexS][indexG] { continue }
            
            for dir in 0..<dx.count {
                let ny = indexS + dy[dir]
                let nx = indexG + dx[dir]
                
                if ny < 0 || nx < 0 || ny >= sero || nx >= garo { continue }
                if board[ny][nx] != 0 { continue }
                if tempBoard[indexS][indexG] == 0 { continue }
                tempBoard[indexS][indexG] -= 1
                tempVisit[indexS][indexG] = true
            }
        }
    }
    
    return tempBoard
}
