//230509_프렌즈4블록_프로그래머스

var realBoard: [[String]] = []
var visit: [[Bool]] = []
var answer = 0

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    for index in 0..<board.count {
        realBoard.append(board[index].map { String($0) })
    }
    visit = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    
    while check() {
        delete()
        move()
        visit = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    }
    
    return answer
}

// 삭제 될 것이 있는지 확인, 
func check() -> Bool {
    for sero in 1..<realBoard.count {
        for garo in 1..<realBoard[0].count {
            if realBoard[sero][garo] == "0" { continue }
            if realBoard[sero][garo] == realBoard[sero][garo - 1] 
            && realBoard[sero][garo] == realBoard[sero - 1][garo] 
            && realBoard[sero][garo] == realBoard[sero - 1][garo - 1] {
                visit[sero][garo] = true
                visit[sero - 1][garo] = true
                visit[sero][garo - 1] = true
                visit[sero - 1][garo - 1] = true
            }
        }
    }
    
    return visit.flatMap { $0 }.contains(true) ? true : false
}

// 삭제 
func delete() {
    for sero in 0..<realBoard.count {
        for garo in 0..<realBoard[0].count {
            if visit[sero][garo] {
                realBoard[sero][garo] = "0"
                answer += 1
            }
        }
    }
}

// 아래로 땡기기 
func move() {
    for sero in (0..<realBoard.count).reversed() {
        for garo in (0..<realBoard[0].count).reversed() {
            if realBoard[sero][garo] == "0" {
                for index in (0..<sero).reversed() {
                    if realBoard[index][garo] != "0" {
                        realBoard[sero][garo] = realBoard[index][garo]
                        realBoard[index][garo] = "0"
                        break
                    } 
                }
            }
        }
    }
}
