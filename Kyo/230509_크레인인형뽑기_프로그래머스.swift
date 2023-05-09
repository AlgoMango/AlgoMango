//230509_크레인인형뽑기_프로그래머스
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stack: [Int] = []
    var answer = 0
    var board = board
    
    for index in 0..<moves.count {
        var col = moves[index] - 1
        
        for index2 in 0..<board.count {
            if board[index2][col] != 0 {
                // 스택에 넣기
                if !stack.isEmpty && stack.last! == board[index2][col] {
                    answer += 2
                    stack.removeLast()
                } else {
                    stack.append(board[index2][col])
                }
                
                board[index2][col] = 0
                break
            }
        }
    }
    
    return answer
}
