//https://www.acmicpc.net/problem/10026

/*
 문제이해
 N×N인 그리드의 각 칸에 R(빨강), G(초록), B(파랑) 중 하나를 색칠한 그림에 상하좌우 같은색이면 한구역

 RRRBB  적록색약이 아닌 사람 => 4 구역(빨강 2, 파랑 1, 초록 1)
 GGBBB  적록색약 => 3 구역 (빨강-초록 2, 파랑 1)
 BBBRR
 BBRRR
 RRRRR
 --------------------------------------------------------------------------------
 풀이
 dfs
 enum으로 정상인, 적록색약구분하고 dfs 함수에 매개변수로 줌
 */

import Foundation

enum Kind {
    case normal, abnormal
}

let n: Int = Int(readLine()!)!
var normalColors: [[Character]] = []
var abnormalColors: [[Character]] = [] // G는 R로담김

var normalCount: Int = 0
var abnormalCount: Int = 0

for _ in 0..<n {
    let colorLine = readLine()!
    normalColors.append( colorLine.map { $0 } )
    abnormalColors.append( colorLine.map { changeChar($0) } )
}

for x in 0..<n {
    for y in 0..<n {
        dfs(x: x, y: y, kind: .normal)
        dfs(x: x, y: y, kind: .abnormal)
    }
}

func changeChar(_ char: Character) -> Character {
    return char == "G" ? "R" : char
}

func dfs(x: Int, y: Int, kind: Kind) {
    let xMove: [Int] = [0, 0, 1, -1]
    let yMove: [Int] = [-1, 1, 0, 0]
    var color: Character = "T" // 임시 T저장
    var stack: [(x: Int, y: Int)] = [(x: x, y: y)]

    if kind == .normal {
        guard normalColors[x][y] != "V" else { return }  // V = Visited 방문완료
        color = normalColors[x][y]
        normalColors[x][y] = "V"
        normalCount += 1
    } else if kind == .abnormal {
        guard abnormalColors[x][y] != "V" else { return }
        color = abnormalColors[x][y]
        abnormalColors[x][y] = "V"
        abnormalCount += 1
    }

    while !stack.isEmpty {
        let xy = stack.removeLast()

        for i in 0..<4 {
            let x2 = xy.x - xMove[i]
            let y2 = xy.y - yMove[i]

            guard x2 >= 0 && x2 < n && y2 >= 0 && y2 < n else {
                continue
            }

            if kind == .normal && normalColors[x2][y2] == color {
                stack.append((x: x2, y: y2))
                normalColors[x2][y2] = "V"
            } else if kind == .abnormal && abnormalColors[x2][y2] == color {
                stack.append((x: x2, y: y2))
                abnormalColors[x2][y2] = "V"
            }
        }
    }
}

print(normalCount)
print(abnormalCount)
