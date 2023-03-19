//https://www.acmicpc.net/problem/4179

/*
 문제이해
 미로에서 지훈이 1명과 불들이 있을 때 불은 각 지점에서 네 방향(대각선 제외)으로 확산되고 지훈은 미로 가장자리에서 탈출 할 수 있다. (불과 지훈 모두 벽은 통과 못한다.)

 입력
  첫째 줄: 미로의 행과 열인 R과 C (1 ≤ R, C ≤ 1000)
  다음 줄 ~ : R줄동안 각각의 미로 행이 주어진다. #: 벽 // .: 길 // J: 지훈이의 미로에서의 초기위치 (지나갈 수 있는 공간) // F: 불이 난 공간
        미로 탈출 불가 -> IMPOSSIBLE 출력
        미로 탈출 가능 -> 가장 빠른 탈출시간을 출력
 --------------------------------------------------------------------------------
 풀이
 readLine 받으면서 불들과, 지훈이 x,y를 기록해두기 ->
 불 지도 먼저 그리기 ( 지도에 불이 몇 step인지 표기해줘야함 ) ->
 지훈이를 움직일 땐 불보다 먼저 움직이는 지 확인하기
   영역에 포함 확인 하는 연산자 ⭐️(~=)⭐️  ex (0...10) ~= n ➡️ n이 0~10 사이에 포함인지 확인하는 연산자임
 */

import Foundation

// 입력받아 지도그리기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (row, column) = (input[0], input[1])

var miro: [[Character]] = []
var fires: [(x: Int, y: Int, step: Int)] = []
var jihoon: (x: Int, y: Int, step: Int) = (x: 0, y: 0, step: 0)

for xVal in 0..<row {
    let rowInput: [Character] = Array(readLine()!)
    miro.append(rowInput)

    for (yVal, char) in rowInput.enumerated() {  //J, F 위치들 input받으면서 저장해 두기
        if char == "J" {
            jihoon = (x: xVal, y: yVal, step: 0)
        } else if char == "F" {
            fires.append((x: xVal, y: yVal, step: 0))
        }
    }
}

//불 확산 지도 그리기
var firesMap: [[Int]] = Array(repeating: Array(repeating: Int.max, count: column), count: row)

let xMove: [Int] = [0, 0, 1, -1]
let yMove: [Int] = [1, -1, 0, 0]

var firesIndex: Int = 0

while firesIndex < fires.count { // ⭐️⭐️⭐️ index 컴파일 에러나지 않도록 firesIndex < fires.count 를 조건으로 while문 돌리기
    let (x, y, step) = (fires[firesIndex].x, fires[firesIndex].y, fires[firesIndex].step)

    firesIndex += 1

    for i in 0..<4 {
        let (x2, y2, step2) = (x + xMove[i], y + yMove[i], step + 1)

        guard (0..<row) ~= x2 && (0..<column) ~= y2 && miro[x2][y2] == "." && firesMap[x2][y2] > step2 else { continue }

        firesMap[x2][y2] = step2
        fires.append((x: x2, y: y2, step: step2))
    }
}

// 지훈이 이동
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)
var stack: [(x: Int, y: Int, step: Int)] = [jihoon]
var stackIndex: Int = 0

while stackIndex < stack.count {
    let (x, y, step) = (stack[stackIndex].x, stack[stackIndex].y, stack[stackIndex].step)
    stackIndex += 1

    for i in 0..<4 {
        let (x2, y2, step2) = (x + xMove[i], y + yMove[i], step + 1)

        guard (0..<row) ~= x2 && (0..<column) ~= y2 else {  // 영역을 벗어나면 step을 출력하고 탈출
            print(step2)
            exit(0)
        }
        guard miro[x2][y2] == "." && firesMap[x2][y2] > step2 && visited[x2][y2] == false else { continue } // 불확산보다 빨리 지나가는지 확인

        visited[x2][y2] = true
        stack.append((x: x2, y: y2, step: step2))
    }
}

print("IMPOSSIBLE") // 위 while 문에서 탈출 못했으면 IMPOSSIBLE 출력
