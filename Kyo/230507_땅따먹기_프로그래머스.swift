//230507_땅따먹기_프로그래머스
import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: land.count)
    
    if land.count == 0 { return 0 }
    
    board[0] = land[0]
    
    for index in 1..<land.count {
        board[index][0] = max(board[index - 1][1], board[index - 1][2], board[index - 1][3]) + land[index][0]
        board[index][1] = max(board[index - 1][0], board[index - 1][2], board[index - 1][3]) + land[index][1]
        board[index][2] = max(board[index - 1][0], board[index - 1][1], board[index - 1][3]) + land[index][2]
        board[index][3] = max(board[index - 1][0], board[index - 1][1], board[index - 1][2]) + land[index][3]
    }

    return board[land.count - 1].max()!
}
