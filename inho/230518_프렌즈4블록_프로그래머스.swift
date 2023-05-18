//https://school.programmers.co.kr/learn/courses/30/lessons/17679

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var boards = [[Character]]()
    var coordinates = [(Int, Int)]()
    let dx = [0, 1, 1, 0], dy = [0, 0, 1, 1]
    var result = 0
    
    for line in board {
        boards.append(Array(line))
    }
    
    func isFourBlock(x: Int, y: Int, sign: Character) -> Bool {
        guard sign != " " else { return false }
        
        if x+1 < n, boards[y][x+1] == sign, y+1 < m, boards[y+1][x+1] == sign, boards[y+1][x] == sign {
            return true
        }
        
        return false
    }
    
    repeat {
        coordinates = []
        
        for x in 0..<n {
            for y in 0..<m {
                if isFourBlock(x: x, y: y, sign: boards[y][x]) {
                    coordinates.append((x, y))
                }
            }
        }
        
        for coordinate in coordinates {
            for i in 0...3 {
                let next = (coordinate.0 + dx[i], coordinate.1 + dy[i])
                
                if boards[next.1][next.0] != " " {
                    boards[next.1][next.0] = " "
                    result += 1
                }
            }
        }
        
        for _ in 0..<m {
            for y in 0..<m {
                for x in 0..<n {
                    if boards[y][x] != " ", y+1 < m, boards[y+1][x] == " " {
                        boards[y+1][x] = boards[y][x]
                        boards[y][x] = " "
                    }
                }
            }
        }
    } while !coordinates.isEmpty
        
    return result
}
