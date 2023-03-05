// https://www.acmicpc.net/problem/1926

/*
 문제이해

 도화지 속 그림의 개수와, 그림 중 가장 넓은 것의 넓이를 출력해라. 1로 연결된 것을 한 그림이라함
 가로,세로 연결은 연결이 맞고/ 대각선으로 연결은 떨어진 그림이다.

 첫째 줄: 도화지 세로 크기 n(1 ≤ n ≤ 500), 가로 크기 m(1 ≤ m ≤ 500)가 차례로 주어진다.
 둘째 ~ n+1 줄: 그림의 정보가 주어진다.(0은 색칠X, 1은 색칠O)

 출력: 첫째 줄에는 그림의 개수, 둘째 줄에는 그 중 가장 넓은 그림의 넓이를 출력한다. (그림이 0개면 가장 넓은 그림의 넓이도 0이다)

 --------------------------------------------------------------------------------
DFS (방문확인: Bool값인 똑같은 크기의 이중 배열로 확인)
 1 1 0 0 0  T T F F F
 0 1 1 0 0  F T T F F
 0 0 0 0 0  F F F F F
 0 0 1 1 1  F F F F F
 0 0 1 1 1  F F F F F

 */

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let maxRow: Int = input[0] // 도화지 세로
let maxCol: Int = input[1] // 도화지 가로

var drawing: [[Int]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maxCol), count: maxRow) //방문했는지 체크하는 Bool Array로 도화지만큼 false가 담김

for _ in 0..<maxRow {
    let lineDrawing: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    drawing.append(lineDrawing)
}

var drawCount: Int = 0 // 출력할 그림 갯수
var maxArea: Int = 0   // 출력할 그림 최대 넓이

// 도화지 세로와 가로를 모두 돌며 bfs() 함수로 확인
for row in 0..<maxRow {
    for col in 0..<maxCol {
        bfs(row: row, col: col)
    }
}

func bfs(row: Int, col: Int) {
    // 값이 0이거나 들렸던 곳이면 탈출
    guard drawing[row][col] == 1,
          !visited[row][col] else {
        return
    }

    var queue: [(r: Int, c: Int)] = [(r: row, c: col)]
    var area: Int = 1 // queue에 하나 담았기 때문에 area는 1로 시작

    // 지금 포인트에서 사방(⬆️⬇️➡️⬅️) 옮겨갈 때 인덱스에 더해줄 값들 Array정리
    let rowMove: [Int] = [1, -1, 0, 0]
    let colMove: [Int] = [0, 0, 1, -1]

    drawCount += 1
    visited[row][col] = true

    while !queue.isEmpty {
        let location: (r: Int, c: Int) = queue.removeFirst()
        let row = location.r
        let col = location.c

        for index in 0..<4 {
            let row2 = row + rowMove[index]
            let col2 = col + colMove[index]

            // 인덱스가 도화지를 넘지 않는지 확인
            if row2 < maxRow && row2 >= 0 && col2 < maxCol && col2 >= 0 {
                // 값이 1인지, 방문 했었던 곳인지 확인
                if drawing[row2][col2] == 1 && !visited[row2][col2] { //👈 재밌는거 바로위에 75번 줄 뒤로 && 으로 추가하면 그 앞에서 index크기먼저 확인되서 통과되는데, 
                    queue.append((r: row2, c: col2))                   //               75번줄 앞으로 && 으로 이동시키면 index범위초과로 런타임 에러남
                    area += 1
                    visited[row2][col2] = true
                }
            }
        }
    }

    maxArea = max(maxArea, area)
}

print(drawCount)
print(maxArea)
