// https://www.acmicpc.net/problem/2468

/*
 문제이해
 안전영역
 N * N 인 2차원 배열, 원소는 건물 높이, 비 높이에따른 잠기지않는 안전구역 갯수 구하기
 --------------------------------------------------------------------------------
 풀이
 dfs
 */

import Foundation

let n: Int = Int(readLine()!)!
var heights: [[Int]] = []
var isVisit: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

for _ in 0..<n {
    heights.append( readLine()!.split(separator: " ").map { Int(String($0))! } )
}

var maxRain: Int = 0
var count: Int = 0

for rain in 0..<100 {
    for x in 0..<n {
        for y in 0..<n {
            dfs(x: x, y: y, rain: rain)
        }
    }
    maxRain = max(maxRain, count)
    isVisit = Array(repeating: Array(repeating: false, count: n), count: n)
    count = 0
}

func dfs(x: Int, y: Int, rain: Int) {
    guard !isVisit[x][y],
          heights[x][y] > rain else {
        return
    }

    let xMove: [Int] = [0, 0, 1, -1]
    let yMove: [Int] = [-1, 1, 0, 0]

    var stack: [(x: Int, y: Int)] = [(x: x, y: y)]
    isVisit[x][y] = true
    count += 1

    while !stack.isEmpty {
        let xy = stack.removeLast()

        for i in 0..<4 {
            let x2 = xy.x - xMove[i]
            let y2 = xy.y - yMove[i]

            if x2 >= 0 && x2 < n && y2 >= 0 && y2 < n && heights[x2][y2] > rain && !isVisit[x2][y2] {
                stack.append((x: x2, y: y2))
                isVisit[x2][y2] = true
            }
        }
    }
}

print(maxRain)
