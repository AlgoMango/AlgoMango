//230406_1992쿼드트리_백준

let lineCount = Int(readLine()!)! // 라인 수

var board: [[Int]] = []         // Board

for _ in 0..<lineCount {
    let line = readLine()!.map { Int(String($0))! }
    board.append(line)
}

var answer: String = ""

recursion(line: lineCount, startSero: 0, endSero: lineCount, startGaro: 0, endGaro: lineCount)

// Answer Output
print(answer)


// 재귀 함수 정의
func recursion(line: Int, startSero: Int, endSero: Int, startGaro: Int, endGaro: Int) {
    let result = checkBoard(
        line: line, startSero: startSero, endSero: endSero, startGaro: startGaro, endGaro: endGaro
    )
    
    if result == 0 {
        answer += "0"
    } else if result == 1 {
        answer += "1"
    } else {
        let banthing = line / 2
        answer += "("
        
        // 왼쪽 위
        recursion(
            line: banthing,
            startSero: startSero,
            endSero: startSero + banthing,
            startGaro: startGaro,
            endGaro: startGaro + banthing
        )
        
        // 오른쪽 위
        recursion(
            line: banthing,
            startSero: startSero,
            endSero: startSero + banthing,
            startGaro: startGaro + banthing,
            endGaro: endGaro
        )
        
        // 왼쪽 아래
        recursion(
            line: banthing,
            startSero: startSero + banthing,
            endSero: endSero,
            startGaro: startGaro,
            endGaro: startGaro + banthing
        )
        
        // 오른쪽 아래
        recursion(
            line: banthing,
            startSero: startSero + banthing,
            endSero: endSero,
            startGaro: startGaro + banthing,
            endGaro: endGaro
        )
        
        answer += ")"
    }
}

// Check Board
func checkBoard(line: Int, startSero: Int, endSero: Int, startGaro: Int, endGaro: Int) -> Int {
    var flag = 0
    for y in startSero..<endSero {
        for x in startGaro..<endGaro {
            if board[y][x] == 1 {
                flag += 1
            } else if flag != 0 {   // 섞여있는 경우
                return 2
            }
        }
    }
    
    if flag == 0 {  // 모두 0 인 경우
        return 0
    } else if flag == (endSero - startSero) * (endGaro - startGaro) { // 모두 1 인 경우
        return 1
    } else {    // 섞여있는 경우
        return 2
    }
}
