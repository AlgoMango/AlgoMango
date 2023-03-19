//https://www.acmicpc.net/problem/7569

/*
 문제이해
 3차원 익은 토마토들의 인접한 곳에 있는 토마토들이 익게됌 (위, 아래, 왼쪽, 오른쪽, 앞, 뒤) (1: 익은 토마토 / 0: 익지 않은 토마토 / -1: 토마토 없는 칸)
 토마토가 모두 익을 때까지 최소 며칠인지 출력
 예외: 에초에 모두 익어있으면 0 출력, 모두 익지는 못하면 -1 출력
 --------------------------------------------------------------------------------
 풀이
 3차원배열로풀기 array = [[[..y개]...x개]..z개]. => 접근 array[z][x][y]
 모두 익지 못하는 경우를 위해 0의 갯수 세어놓은 후 -1씩 하면서 모두익는지 확인
 */

import Foundation

// 토마토 인풋 받기
let sizes: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n, h) = (sizes[0], sizes[1], sizes[2])

var tomatos: [[[Int]]] = Array(repeating: [], count: h)
var stack: [(x: Int, y: Int, z: Int, day: Int)] = []
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: h)
var zeroCount: Int = 0 // 애초에 안익은게 있는지 확인해야됌

for zVal in 0..<h {
    for xVal in 0..<n {
        let tomatoLine = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomatos[zVal].append(tomatoLine)

        for (yVal, tomato) in tomatoLine.enumerated() {
            if tomato == 1 {
                stack.append((x: xVal, y: yVal, z: zVal, day: 0))
                visited[zVal][xVal][yVal] = true
            } else if tomato == -1 {
                visited[zVal][xVal][yVal] = true
            } else if tomato == 0 {
                zeroCount += 1
            }
        }
    }
}

guard zeroCount != .zero else { // 처음부터 모두 익어있으면 0 출력하고 끝내기
    print(0)
    exit(0)
}

// 3차원 bfs하기
let xMove: [Int] = [1, -1, 0, 0, 0, 0]
let yMove: [Int] = [0, 0, -1, 1, 0, 0]
let zMove: [Int] = [0, 0, 0, 0, 1, -1]
var stackIndex: Int = 0
var minDay: Int = 0

while stackIndex < stack.count {
    let (x, y, z, day) = (stack[stackIndex].x, stack[stackIndex].y, stack[stackIndex].z, stack[stackIndex].day)
    stackIndex += 1

    for i in 0..<6 {
        let (x2, y2, z2, day2) = (x + xMove[i], y + yMove[i], z + zMove[i], day + 1)

        guard (0..<n) ~= x2 && (0..<m) ~= y2 && (0..<h) ~= z2 && visited[z2][x2][y2] == false else { continue }

        stack.append((x: x2, y: y2, z: z2, day: day2))
        visited[z2][x2][y2] = true
        zeroCount -= 1
        minDay = day2
    }
}

zeroCount == 0 ? print(minDay) : print(-1)
