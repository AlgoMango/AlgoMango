// 30분
// 메모리 왤케 빡빡함?

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]
var map: [[Int]] = []
var answer: [[Int]] = []

func solve() {
    var problem: Int = 1
    while true {
        map = []
        let size = Int(readLine()!)!
        if size == 0 { break }
        for _ in 0..<size {
            let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
            map.append(line)
        }
        
        let max = size * size * 9
        answer = Array(repeating: Array(repeating: max, count: size), count: size)
        answer[0][0] = map[0][0]
        
        move(r: 0, c: 0, size: size)
        print("Problem \(problem): \(answer[size - 1][size - 1])")
        problem += 1
    }
}

func move(r: Int, c: Int, size: Int) {
    var queue: [(r: Int, c: Int)] = [(r, c)]
    var idx: Int = 0
    
    while idx < queue.count {
        let cur = queue[idx]
        for i in 0..<4 {
            let nr = cur.r + dr[i]
            let nc = cur.c + dc[i]
            
            if nr < 0 || nr >= size || nc < 0 || nc >= size { continue }
            if answer[nr][nc] <= answer[cur.r][cur.c] + map[nr][nc] { continue }
            answer[nr][nc] = answer[cur.r][cur.c] + map[nr][nc]
            queue.append((nr, nc))
        }
        idx += 1
    }
}

solve()
