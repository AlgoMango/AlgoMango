// https://www.acmicpc.net/problem/9663
// 중요한건 꺾였는데도 제출하는 마음,,ㅎㅅㅎ

func solution() {
    let count = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: "o", count: count), count: count)
    var rowsContain = Array(repeating: false, count: count)
    var colsContain = Array(repeating: false, count: count)
    var result = 0
    
    func backTrack(row: Int) {
        if row == count {
            result += 1
            return
        }
        
        for i in 0..<count {
            if !rowsContain[row], !colsContain[i], isValid(row: row, col: i) {
                board[row][i] = "x"
                rowsContain[row] = true
                colsContain[i] = true
                backTrack(row: row + 1)
                board[row][i] = "o"
                rowsContain[row] = false
                colsContain[i] = false
            }
        }
    }
    
    func isValid(row: Int, col: Int) -> Bool {
        for i in 0..<row {
            let distance = row - i
            
            if col - distance >= 0, board[i][col - distance] == "x" {
                return false
            }
            
            if board[i][col] == "x" {
                return false
            }
            
            if col + distance < count, board[i][col + distance] == "x" {
                return false
            }
        }
        return true
    }
    
    backTrack(row: 0)
    print(result)
}

solution()
