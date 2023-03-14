//230314_2468안전영역_백준

let line = Int(readLine()!)!

var board: [[Int]] = []
var visit: [[Bool]] = []

for _ in 0..<line {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
    visit.append(Array(repeating: false, count: line))
}

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var queue: [(Int, Int)] = []
var result: [Int] = []

var villiage = 0
var maxVilliage = 0

// 정렬한 높이 리스트
// var heightList = board.flatMap { $0 }.sorted(by: >)
// var height = heightList.removeFirst()
var maxHeight = board.flatMap{ $0 }.max()!
var index = 0

//while !heightList.isEmpty {       // while로 할 경우 메모리초과 발생
for height in 0..<maxHeight+1 {  // 높이 갱신
    
    visit = initialVisit(visit)
    
    villiage = 0
    for sero in 0..<line {
        for garo in 0..<line {
            if visit[sero][garo] { continue }
            if board[sero][garo] <= height { continue }
            
            villiage += 1
            visit[sero][garo] = true
            queue.append((sero, garo))
            
            
            while index < queue.count {
                let cur = queue[index]  // 시간초과?
                index += 1
                
                for dir in 0..<4 {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    
                    if nx < 0 || ny < 0 || nx >= line || ny >= line { continue }
                    if visit[ny][nx] || board[ny][nx] <= height { continue }
                    visit[ny][nx] = true
                    queue.append((ny, nx))
                }
            }
        }
    }
    
    maxVilliage = max(villiage, maxVilliage)
//    height = heightList.removeLast()
}

print(maxVilliage)


// visit 초기화 함수
func initialVisit(_ visit: [[Bool]]) -> [[Bool]] {
    let newVisit = Array(repeating: Array(repeating: false, count: visit.count), count: visit.count)
    return newVisit
}
