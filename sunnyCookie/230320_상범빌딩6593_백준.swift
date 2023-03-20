//https://www.acmicpc.net/problem/6593

/*
 문제이해
 상범 빌딩 탈출 하기, 상범 빌딩은 각 변의 길이가 1인 정육면체로 지나갈 수 없거나, 비어있어서 지나갈 수 있게 되어있다.
 각 칸에서 인접한 6개의 칸(동,서,남,북,상,하)으로 1분의 시간을 들여 이동할 수 있다. 상범 빌딩의 바깥면도 모두 금으로 막혀있어 출구를 통해서만 탈출할 수 있다.
 당신은 상범 빌딩을 탈출할 수 있을까? 만약 그렇다면 얼마나 걸릴까?

 입력
 첫번째 줄: L, R, C // L = 빌딩 층 수(1 ≤ L ≤ 30) // R(1 ≤ R ≤ 30) = 한 층의 행 // C(1 ≤ C ≤ 30) 한 층의 열
 다음줄~ : C개의 문자로 이루어진 R개의 행이 L번 주어진다.  막힘: "#" // 비어있는 칸: '.' // 시작 지점 'S' // 출구는 'E' // 각 층 사이에는 빈 줄,
 입력의 끝은 L, R, C가 모두 0으로 표현 >> 테스트 케이스 끝

 출력
 탈출가능 -> "Escaped in x minute(s)" // 탈출 불가능 -> "Trapped!"
 --------------------------------------------------------------------------------
 풀이

 bfs -> index로 접근하기

 */

import Foundation

while true {
    //입력값들 받아서 변수에 담아주기
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (l, r, c) = (input[0], input[1], input[2]) // l 층 수 // r 한 층의 행 // c 한 층의 열

    guard input != [0, 0, 0] else { exit(0) } // 0 0 0 입력되면 탈출

    var building: [[[Character]]] = Array(repeating: [], count: l)
    var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: l)
    var exit: (x: Int, y: Int, z: Int) = (x: 0, y: 0, z: 0)
    var start: (x: Int, y: Int, z: Int, count: Int) = (x: 0, y: 0, z: 0, count: 0)

    for z in 0..<l {
        for x in 0..<r {
            let line: [Character] = Array(readLine()!)
            building[z].append(line)

            for y in 0..<c {
                if line[y] == "#" {
                    visited[z][x][y] = true  // 벽은 방문 한걸로 처리해서 못 가도록 막기
                } else if line[y] == "S" {
                    start = (x: x, y: y, z: z, count: 0)
                } else if line[y] == "E" {
                    exit = (x: x, y: y, z: z)
                }
            }
        }

        let spacing = readLine()! // 빈 줄 버리기
    }

    // start에서 시작해서 Exit까지 찾아가기
    let xMove: [Int] = [1, -1, 0, 0, 0, 0]
    let yMove: [Int] = [0, 0, 1, -1, 0, 0]
    let zMove: [Int] = [0, 0, 0, 0, 1, -1]

    var stack: [(x: Int, y: Int, z: Int, count: Int)] = [start]
    var index: Int = 0

    while index < stack.count {
        let (x, y, z, count) = (stack[index].x, stack[index].y, stack[index].z, stack[index].count)

        if x == exit.x && y == exit.y && z == exit.z {
            print("Escaped in \(count) minute(s).")
            break
        }

        for i in 0..<6 {
            let (x2, y2, z2, count2) = (x + xMove[i], y + yMove[i], z + zMove[i], count + 1)

            guard (0..<r) ~= x2 && (0..<c) ~= y2 && (0..<l) ~= z2 && !visited[z2][x2][y2] else { continue }

            stack.append((x: x2, y: y2, z: z2, count: count2))
            visited[z2][x2][y2] = true
        }

        index += 1
    }

    if index >= stack.count {  // while문 빠져나와서 안에서 break 안 걸린 경우에만 출력
        print("Trapped!")
    }
}
