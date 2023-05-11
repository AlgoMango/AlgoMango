import Foundation

var map: [[Int]] = []
var answer: [Int] = []

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    map = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    for i in 0..<rows {
        for j in 0..<columns {
            map[i][j] = i * columns + j + 1
        }
    }
    
    for query in queries {
        rotate(query[0] - 1, query[1] - 1, query[2] - 1, query[3] - 1)
    }
    
    return answer
}

// x1, y1, x2, y2값이 들어오면 회전하는 칸들은
// (x1, y1) ~< (x1, y2): 해당 구간은 y+1
// (x1, y1) <~ (x2, y1): 해당 구간은 x-1
// (x2, y1) <~ (x2, y2): 해당 구간은 y-1
// (x1, y2) ~< (x2, y2): 해당 구간은 x+1
func rotate(_ startX: Int, _ startY: Int, _ endX: Int, _ endY: Int) {
    let height = endX - startX + 1
    let width = endY - startY + 1
    var rotatedCopy = Array(repeating: Array(repeating: 0, count: width), count: height)
    var min: Int = 10_001
    
    // (2,2) (5,6) 구간일 때 -> 4x5 크기
    // 2 + 0부터 2 + 3까지 3 = 구간 크기
    // 원래 배열 복사 (가운데 부분 때문에)
    for x in 0..<height {
        for y in 0..<width {
            rotatedCopy[x][y] = map[startX + x][startY + y]
        }
    }
    
    // 회전
    for y in 1..<width {
        rotatedCopy[0][y] = map[startX][startY + y - 1]
        if map[startX][startY + y - 1] < min { min = map[startX][startY + y - 1] }
    }
    // 2x2 배열일 경우
    // r[0][1] = map[0][0+1-1] = map[0][0]
    
    for x in 1..<height {
        rotatedCopy[x][width - 1] = map[startX + x - 1][endY]
        if map[startX + x - 1][endY] < min { min = map[startX + x - 1][endY] }
    }
    // 2x2 배열일 경우
    // r[1][1] = map[0+1-1][1] = map[0][1]
    
    for y in 0..<width - 1 {
        rotatedCopy[height - 1][y] = map[endX][startY + y + 1]
        if map[endX][startY + y + 1] < min { min = map[endX][startY + y + 1] }
    }
    // 2x2 배열일 경우
    // r[1][0] = map[1][0+0+1] = map[1][1]
    
    for x in 0..<height - 1 {
        rotatedCopy[x][0] = map[startX + x + 1][startY]
        if map[startX + x + 1][startY] < min { min = map[startX + x + 1][startY] }
    }
    // 2x2 배열의 경우
    // r[0][0] = map[0+0+1][0] = map[1][0]
    
    // 회전한 배열을 원래 map에 집어넣기
    for x in 0..<height {
        for y in 0..<width {
            map[startX + x][startY + y] = rotatedCopy[x][y]
        }
    }
    
    // answer 배열에 최솟값 추가
    answer.append(min)
}
