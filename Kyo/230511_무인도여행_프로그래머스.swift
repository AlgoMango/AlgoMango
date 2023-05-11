//230511_무인도여행_프로그래머스
import Foundation

func solution(_ maps:[String]) -> [Int] {
    // X는 바다, 숫자는 무인도
    // 숫자는 식량 
    var board: [[Int]] = []
    for map in 0..<maps.count {
        var temp: [Int] = []
        var mapArray = maps[map].map{ String($0) }
        for index in 0..<mapArray.count {
            if mapArray[index] == "X" {
                temp.append(-1)
                continue
            }
            temp.append(Int(mapArray[index])!)
        }
        board.append(temp)
    }
    
    var visit = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    
    var dx = [1, 0, -1, 0]
    var dy = [0, 1, 0, -1]
    
    var answer: [Int] = []
    
    for sero in 0..<board.count {
        for garo in 0..<board[0].count {
            if visit[sero][garo] { continue }
            if board[sero][garo] == -1 { continue }
            
            visit[sero][garo] = true
            var count = board[sero][garo]
            var index = 0
            var queue: [(Int, Int)] = [(sero, garo)]
            
            while index < queue.count {
                let cur = queue[index]
                index += 1
                for dir in 0..<dx.count {
                    let ny = cur.0 + dy[dir]
                    let nx = cur.1 + dx[dir]
                    
                    if ny < 0 || nx < 0 || ny >= board.count || nx >= board[0].count { continue }
                    if visit[ny][nx] || board[ny][nx] == -1 { continue }
                    
                    visit[ny][nx] = true
                    count += board[ny][nx]
                    queue.append((ny, nx))
                }
            }
            
            answer.append(count)
        }
    }
    
    return answer.isEmpty ? [-1] : answer.sorted(by: <)
}
