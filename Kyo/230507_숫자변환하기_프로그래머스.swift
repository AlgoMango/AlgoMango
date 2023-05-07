//230507_숫자변환하기_프로그래머스
import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    
    var board: [Int] = Array(repeating: 0, count: y + 1)
    var queue: [Int] = [x]
    
    if x == y { return 0 }
    
    while !queue.isEmpty {
        if board[y] != 0 { break }
        
        let cur = queue.removeFirst()

        for dir in [cur + n, cur * 2, cur * 3] {
            
            if dir > y { continue }
            if board[dir] != 0 { continue }
            board[dir] = board[cur] + 1
            queue.append(dir)
        }
    }
    
    return board[y] == 0 ? -1 : board[y]
}
