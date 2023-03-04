//230304_1926그림_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let sero = input[0] // 도화지 세로 크기
let garo = input[1] // 도화지 가로 크기

var board: [[Int]] = []
var visit = Array(repeating: Array(repeating: false, count: garo), count: sero)

for _ in 0..<sero {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
}

// 움직일 경로
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var queue: [(Int, Int)] = []
var cnt = 0 // 그림 갯수
var maxPic = 0 // 그림 최대 크기

for y in 0..<sero {
    for x in 0..<garo {
        if visit[y][x] { continue }
        if board[y][x] == 0 { continue }
        
        queue.append((y, x))
        visit[y][x] = true
        
        cnt += 1 // 그림 갯수 증가
        var pic = 1 // 그림 크기
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for index in 0..<dx.count {
                let newY = cur.0 + dy[index]
                let newX = cur.1 + dx[index]
                
                if newY < 0 || newX < 0 || newY >= sero || newX >= garo { continue }
                if visit[newY][newX] { continue }
                if board[newY][newX] != 1 { continue }
                queue.append((newY, newX))
                visit[newY][newX] = true // 방문 체크
                pic += 1        // 그림 크기 증가
            }
        }
        maxPic = max(maxPic, pic) // 그림 크기 비교
    }
}

print(cnt)
print(maxPic)
