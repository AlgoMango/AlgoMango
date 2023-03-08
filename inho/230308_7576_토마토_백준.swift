//https://www.acmicpc.net/problem/7576
//그림과 비슷한 풀이

func solution() {
    let size = readLine()!.split(separator: " ").map { Int(String($0))! }
    let width = size[0], height = size[1]
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var tomato: [[Int]] = []
    var start: [(Int, Int, Int)] = []
    
    func bfs() -> Int {
        var queue: [(x: Int, y: Int, count: Int)] = start
        var result = -1
        var index = 0
        
        while index < queue.count {
            let node = queue[index]
            
            index += 1
            result = node.count + 1
            
            for i in 0...3 {
                let next = (node.x + dx[i], node.y + dy[i], node.count + 1)
                
                guard next.0 >= 0, next.0 < width,
                      next.1 >= 0, next.1 < height
                else {
                    continue
                }
                
                if tomato[next.1][next.0] == 0 {
                    tomato[next.1][next.0] = 1
                    queue.append(next)
                }
            }
        }
        
        return result
    }

    for _ in 0..<height {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomato.append(input)
    }

    for i in 0..<width {
        for j in 0..<height {
            if tomato[j][i] == 1 {
                start.append((i, j, -1))
            }
        }
    }

    let result = bfs()
    
    if tomato.flatMap({ $0 }).contains(0) {
        print(-1)
    } else {
        print(result)
    }
}

solution()
