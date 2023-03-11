//https://www.acmicpc.net/problem/2667

/*
 문제이해
 지도의 크기 N(정사각형이므로 가로와 세로의 크기는 같으며 5≤N≤25)
 연결된 1끼리 단지라고 정의
 --------------------------------------------------------------------------------
 풀이


 */

import Foundation

let n: Int = Int(readLine()!)!
var aptMap: [[Int]] = []

for _ in 0..<n {
    aptMap.append(readLine()!.map { Int(String($0))! })
}

var danji: [Int] = []
let xMove: [Int] = [0, 0, -1, 1]
let yMove: [Int] = [-1, 1, 0, 0]

for x in 0..<n {
    for y in 0..<n {
        dfs(x: x, y: y)
    }
}

func dfs(x: Int, y: Int) {
    guard aptMap[x][y] == 1 else { return }

    let xMove: [Int] = [0, 0, -1, 1]
    let yMove: [Int] = [-1, 1, 0, 0]

    var stack: [(x: Int, y: Int)] = [(x: x, y: y)]
    var count: Int = 1
    aptMap[x][y] = 0

    while !stack.isEmpty {
        let xy: (x: Int, y: Int) = stack.removeLast()

        for i in 0..<4 {
            let x2 = xy.x + xMove[i]
            let y2 = xy.y + yMove[i]

            if x2 >= 0 && x2 < n && y2 >= 0 && y2 < n && aptMap[x2][y2] == 1 {
                stack.append((x: x2, y: y2))
                count += 1
                aptMap[x2][y2] = 0
            }
        }
    }

    danji.append(count)
}

print(danji.count)
for count in danji.sorted() {
    print(count)
}
