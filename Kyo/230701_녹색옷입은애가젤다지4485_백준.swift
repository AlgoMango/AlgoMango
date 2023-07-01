//230701_녹색옷입은애가젤다지4485_백준
// 30분 내외
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var test = 0
while true {
    test += 1
    // 새로운 테스트케이스 시작
    let line = Int(readLine()!)!
    if line == .zero { break }
    
    var board: [[Int]] = []
    let maxValue = line * line * 9
    var visit: [[Int]] = Array(repeating: Array(repeating: maxValue, count: line), count: line)
    
    var queue: [(Int, Int)] = []
    for _ in 0..<line {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        board.append(input)
    }
    
    queue.append((0, 0))
    visit[0][0] = board[0][0]
    
    var index = 0
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for dir in 0..<dx.count {
            let ny = cur.0 + dy[dir]
            let nx = cur.1 + dx[dir]
            
            if ny < 0 || nx < 0 || nx >= line || ny >= line { continue }
            
            // BFS에서 아래조건이 추가되면 다익스트라인가.. 우선순위 큐를 사용해서 정렬을 해서 작은 것부터 채워나가는게 다익스트라인듯하다.
            // 같은 것도 제껴야한다. 같은게 굳이 큐에 들어갈 필요가 없음. -> " < " 이렇게 할경우 메모리 초과 발생.
            if visit[ny][nx] <= visit[cur.0][cur.1] + board[ny][nx] { continue }
            queue.append((ny, nx))
            visit[ny][nx] = visit[cur.0][cur.1] + board[ny][nx]
        }
    }
    
    print("Problem \(test): \(visit[line - 1][line - 1])")
}
