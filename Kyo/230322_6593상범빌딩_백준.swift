//230322_6593상범빌딩_백준

let dx = [1, 0, -1, 0, 0, 0]
let dy = [0, 1, 0, -1, 0, 0]
let dz = [0, 0, 0, 0, -1, 1]

while let tempInput = readLine() {
    
    var input = tempInput.split(separator: " ").map { Int(String($0))! }
    
    if input == [0, 0, 0] { break }
    
    var height = input[0]    // L
    var sero = input[1]      // R
    var garo = input[2]      // C

    var board: [[[String]]] = []
    var visit: [[[Int]]] = []
    var queue: [(Int, Int, Int)] = []  // 높이, 행, 열 순서
    
    for h in 0..<height {
        
        var temp: [[String]] = []
        var floorVisit: [[Int]] = []
        
        for s in 0..<sero {
            
            let line = readLine()!.map { String($0) }
            temp.append(line)
            var tempVisit: [Int] = []
            
            for g in 0..<garo {
                if line[g] == "#" {
                    tempVisit.append(-1)
                } else if line[g] == "S" {
                    queue.append((h, s, g))
                    tempVisit.append(1)
                } else {
                    tempVisit.append(0)
                }
            }
            floorVisit.append(tempVisit)
            
        }
        
        let blankLine = readLine()!     // 한칸씩 공백 받는 것
        
        board.append(temp)
        visit.append(floorVisit)
    }
    
    // BFS
    var index = 0
    var time = -1
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for dir in 0..<dx.count {
            let nz = cur.0 + dz[dir]
            let ny = cur.1 + dy[dir]
            let nx = cur.2 + dx[dir]
            
            if nz < 0 || ny < 0 || nx < 0 || nz >= height || ny >= sero || nx >= garo { continue }
            if visit[nz][ny][nx] > 1 || board[nz][ny][nx] == "#" { continue }
            
            visit[nz][ny][nx] = visit[cur.0][cur.1][cur.2] + 1
            queue.append((nz, ny, nx))
            
            if board[nz][ny][nx] == "E" {
                time = visit[nz][ny][nx] - 1
            }
        }
    }
    
    // OUTPUT
    if time != -1 {
        print("Escaped in \(time) minute(s).")
    } else {
        print("Trapped!")
    }
}
