//230507_덧칠하기_프로그래머스
import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var board: [Int] = Array(repeating: 1, count: n + 1)
    
    for sec in section {
        board[sec] = 0
    }
    
    var answer = 0
    
    for index in 1..<board.count {
        if board[index] != 0 { continue }
        
        for index2 in 0..<m {
            if index + index2 >= board.count { continue }
            board[index + index2] = 1
        }        
        
        answer += 1
    }
    
    return answer
}
