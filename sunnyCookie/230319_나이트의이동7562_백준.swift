//https://www.acmicpc.net/problem/7562

/*
 문제이해
 체스 나이트 (나이트 이동은 사방으로 두칸 직진 -> 오른쪽 한칸 또는 왼쪽 한 칸 가능)

 입력
 첫째 줄: 테스트 케이스 개수
 각 테스트 케이스는 세 줄로 이루어짐 첫째 줄: 체스판 한 변 길이 (4 ≤ l ≤ 300),
                            둘째 줄: 나이트가 현재 있는 칸
                            셋째 줄: 나이트가 이동하려고 하는 칸
 >> 각 테스트 케이스마다 나이트가 최소 몇 번만에 이동할 수 있는지 출력
 --------------------------------------------------------------------------------
 풀이
 bfs -> index 접근
 */

import Foundation

let caseCount: Int = Int(readLine()!)!

let xMove: [Int] = [-2, -2, 2, 2, -1, -1, 1, 1]
let yMove: [Int] = [-1, 1, -1, 1, -2, 2, -2, 2]

for _ in 0..<caseCount {
    let size: Int = Int(readLine()!)!
    let origin: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let goal: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
    var stack: [(x: Int, y: Int, step: Int)] = [(x: origin[0], y: origin[1], step: 0)]
    var stackIndex: Int = 0
    var answer: Int = 0

    guard origin != goal else {
        print(0)
        continue
    }

    while stackIndex < stack.count {
        let (x, y, step) = (stack[stackIndex].x, stack[stackIndex].y, stack[stackIndex].step)
        stackIndex += 1

        for i in 0..<8 {
            let (x2, y2, step2) = (x + xMove[i], y + yMove[i], step + 1)

            guard (0..<size) ~= x2 && (0..<size) ~= y2 && visited[x2][y2] == false else { continue }

            if x2 == goal[0] && y2 == goal[1] {
                answer = step2
            }

            visited[x2][y2] = true
            stack.append((x: x2, y: y2, step: step2))
        }
    }

    print(answer)
}
