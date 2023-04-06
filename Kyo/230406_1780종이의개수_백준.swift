//230406_1780종이의개수_백준

let input = Int(readLine()!)!
var board: [[Int]] = []

for _ in 0..<input {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
}

var zero = 0
var one = 0
var mone = 0

recursion(line: input, startSero: 0, endSero: input, startGaro: 0, endGaro: input)
print(mone)
print(zero)
print(one)


func checkZero(startSero: Int, endSero: Int, startGaro: Int, endGaro: Int) -> Bool {
    for sero in startSero..<endSero {
        for garo in startGaro..<endGaro {
            if board[sero][garo] != 0 {
                return false
            }
        }
    }

    zero += 1
    return true
}

func checkOne(startSero: Int, endSero: Int, startGaro: Int, endGaro: Int) -> Bool {
    for sero in startSero..<endSero {
        for garo in startGaro..<endGaro {
            if board[sero][garo] != 1 {
                return false
            }
        }
    }

    one += 1
    return true
}


func checkMone(startSero: Int, endSero: Int, startGaro: Int, endGaro: Int) -> Bool {
    for sero in startSero..<endSero {
        for garo in startGaro..<endGaro {
            if board[sero][garo] != -1 {
                return false
            }
        }
    }
    
    mone += 1
    return true
}

func recursion(line: Int, startSero: Int, endSero: Int, startGaro: Int, endGaro: Int) {
    if line < 1 { return }
    
    if checkZero(startSero: startSero, endSero: endSero, startGaro: startGaro, endGaro: endGaro) {
        return
    }
    
    if checkOne(startSero: startSero, endSero: endSero, startGaro: startGaro, endGaro: endGaro) {
        return
    }
    
    if checkMone(startSero: startSero, endSero: endSero, startGaro: startGaro, endGaro: endGaro) {
        return
    }

    let newLine = line/3
    recursion(line: newLine, startSero: startSero, endSero: startSero + newLine, startGaro: startGaro, endGaro: startGaro + newLine)
    recursion(line: newLine, startSero: startSero, endSero: startSero + newLine, startGaro: startGaro + newLine, endGaro: startGaro + (newLine * 2))
    recursion(line: newLine, startSero: startSero, endSero: startSero + newLine, startGaro: startGaro + (newLine * 2), endGaro: endGaro)

    recursion(line: newLine, startSero: startSero + newLine, endSero: startSero + (newLine * 2), startGaro: startGaro, endGaro: startGaro + newLine)
    recursion(line: newLine, startSero: startSero + newLine, endSero: startSero + (newLine * 2), startGaro: startGaro + newLine, endGaro: startGaro + (newLine * 2))
    recursion(line: newLine, startSero: startSero + newLine, endSero: startSero + (newLine * 2), startGaro: startGaro + (newLine * 2), endGaro: endGaro)

    recursion(line: newLine, startSero: startSero + (newLine * 2), endSero: endSero, startGaro: startGaro, endGaro: startGaro + newLine)
    recursion(line: newLine, startSero: startSero + (newLine * 2), endSero: endSero, startGaro: startGaro + newLine, endGaro: startGaro + (newLine * 2))
    recursion(line: newLine, startSero: startSero + (newLine * 2), endSero: endSero, startGaro: startGaro + (newLine * 2), endGaro: endGaro)
}

