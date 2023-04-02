//230402_2630색종이만들기_백준

let lineInput = Int(readLine()!)!


var board: [[Int]] = []

for _ in 0..<lineInput {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
}

// 답
var blue = 0
var white = 0

func banThing(line: Int, startSero: Int, EndSero: Int, startGaro: Int, EndGaro: Int) {
    if line == 0 { return }
    if checkColor(startSero: startSero, EndSero: EndSero, startGaro: startGaro, EndGaro: EndGaro) {
        return
    } else {
        let nextLine = line / 2
        
        // 왼쪽위
        banThing(line: nextLine,
                 startSero: startSero,
                 EndSero: startSero + nextLine,
                 startGaro: startGaro,
                 EndGaro: startGaro + nextLine)
        
        // 오른쪽위
        banThing(line: nextLine,
                 startSero: startSero,
                 EndSero: startSero + nextLine,
                 startGaro: startGaro + nextLine,
                 EndGaro: EndGaro)
        
        // 왼쪽 아래
        banThing(line: nextLine,
                 startSero: startSero + nextLine,
                 EndSero: EndSero,
                 startGaro: startGaro,
                 EndGaro: startGaro + nextLine)
        
        // 오른쪽 아래
        banThing(line: nextLine,
                 startSero: startSero + nextLine,
                 EndSero: EndSero,
                 startGaro: startGaro + nextLine,
                 EndGaro: EndGaro)
    }
}

func checkColor(startSero: Int, EndSero: Int, startGaro: Int, EndGaro: Int) -> Bool {
    let current = board[startSero][startGaro]

    for y in startSero..<EndSero {
        for x in startGaro..<EndGaro {
            if current != board[y][x] { return false }
        }
    }
    
    if current == 0 {
        white += 1
    } else {
        blue += 1
    }
    return true
}

banThing(line: lineInput, startSero: 0, EndSero: lineInput, startGaro: 0, EndGaro: lineInput)
print(white)
print(blue)


// 아래 로직은 왜 안될까
/*
 if startSero == EndSero || startGaro == EndGaro { return }
    if checkColor(startSero: startSero, EndSero: EndSero, startGaro: startGaro, EndGaro: EndGaro) {
        return
    } else {
        let nextLine = line / 2
        
        // 왼쪽위
        banThing(line: nextLine,
                 startSero: startSero,
                 EndSero: EndSero / 2,
                 startGaro: startGaro,
                 EndGaro: EndGaro / 2)
        
        // 오른쪽위
        banThing(line: nextLine,
                 startSero: startSero,
                 EndSero: EndSero / 2,
                 startGaro: EndGaro / 2,
                 EndGaro: EndGaro)
        
        // 왼쪽 아래
        banThing(line: nextLine,
                 startSero: EndSero / 2,
                 EndSero: EndSero,
                 startGaro: startGaro,
                 EndGaro: EndGaro / 2)
        
        // 오른쪽 아래
        banThing(line: nextLine,
                 startSero: EndSero / 2,
                 EndSero: EndSero,
                 startGaro: EndGaro / 2,
                 EndGaro: EndGaro)
    }
*/

