//230330_islandPerimeter_릿코드

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let sero = grid.count
        let garo = grid[0].count
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]

        var board = grid 
        var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: garo), count: sero)

        var queue: [(Int, Int)] = []
        
        var answer = 0
        var index = 0

        for y in 0..<sero {
            for x in 0..<garo {
                if visit[y][x] || board[y][x] == 0 { continue }

                queue.append((y,x))      
                visit[y][x] = true           
                answer += 4
                
                while index < queue.count {
                    let cur = queue[index]
                    index += 1
            
                    var cnt = 0
                    for dir in 0..<dx.count {
                        let ny = cur.0 + dy[dir]
                        let nx = cur.1 + dx[dir]

                        if nx < 0 || ny < 0 || nx >= garo || ny >= sero { continue }
                        if board[ny][nx] == 0 { continue }
                        if visit[ny][nx] { // 닿아있는 면 
                            cnt += 1
                            continue 
                        }

                        queue.append((ny, nx))
                        visit[ny][nx] = true

                        cnt += 1    // 하나 빼기
                        answer += 4
                    }
                    
                    answer -= cnt
                }
            }
        }
        

        return answer
    }
}
