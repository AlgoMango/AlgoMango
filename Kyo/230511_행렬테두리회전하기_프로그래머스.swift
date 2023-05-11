//230511_행렬테두리회전하기_프로그래머스
import Foundation

var answer: [Int] = []
func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    // board 맨들기
    var count = 1
    for sero in 0..<rows {
        for garo in 0..<columns {
            board[sero][garo] = count
            count += 1
        }
    }
    
    for query in queries {
        board = rotate(query, board)
    }
    
    return answer
}

func rotate(_ query: [Int], _ board: [[Int]]) -> [[Int]] {
    var board = board 
    var temp = board
    
    var seroStart = query[0] - 1
    var seroEnd = query[2] - 1 >= board.count ? board.count - 1 : query[2]-1
    var garoStart = query[1] - 1
    var garoEnd = query[3] - 1 >= board[0].count ? board[0].count - 1 : query[3] - 1
    
    var result: [Int] = []
    // 상단 로테이팅
    for indexSero in garoStart+1..<garoEnd {
        temp[seroStart][indexSero] = board[seroStart][indexSero - 1]
        result.append(board[seroStart][indexSero - 1])
    }
    
    // 오른쪽 로테이팅
    for indexGaro in seroStart+1..<seroEnd { 
        temp[indexGaro][garoEnd] = board[indexGaro-1][garoEnd]
        result.append(board[indexGaro-1][garoEnd])
    }
    
    // 하단 로테이팅
    for indexSero in garoStart+1..<garoEnd {
        temp[seroEnd][indexSero] = board[seroEnd][indexSero + 1]
        result.append(board[seroEnd][indexSero + 1])
    }
    
    // 왼쪽 로테이팅
    for indexGaro in seroStart+1..<seroEnd {
        temp[indexGaro][garoStart] = temp[indexGaro+1][garoStart]
        result.append(temp[indexGaro+1][garoStart])
    }
    
    temp[seroStart][garoStart] = board[seroStart+1][garoStart]
    temp[seroStart][garoEnd] = board[seroStart][garoEnd-1]
    temp[seroEnd][garoStart] = board[seroEnd][garoStart+1]
    temp[seroEnd][garoEnd] = board[seroEnd-1][garoEnd]
    
    result.append(temp[seroStart][garoStart])
    result.append(temp[seroStart][garoEnd])
    result.append(temp[seroEnd][garoStart])
    result.append(temp[seroEnd][garoEnd])
    
    answer.append(result.min()!)

    return temp
}
