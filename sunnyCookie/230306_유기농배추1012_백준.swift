

// https://www.acmicpc.net/problem/1012

/*
 문제이해

 배추밭에 해충을 방지해주는 배추흰지렁이가 있다. 어떤 배추에 한 마리라도 살고 있으면
 인접한 다른 배추로 이동할 수 있고 그 배추들 역시 해충으로부터 보호받는다.
 한 배추의 상하좌우 네 방향에 다른 배추가 위치한 경우에 서로 인접해있는 것이다.
 배추밭엔 배추가 군데군데 심어져있다. 배추들이 모여있는 곳에는 배추흰지렁이가 한 마리만 있으면 되므로
 서로 인접해있는 배추들이 몇 군데에 퍼져있는지 조사하면 총 몇 마리의 지렁이가 필요한지 알 수 있다.

 예를 들어 배추밭이 아래와 같이 구성되어 있으면 최소 5마리의 배추흰지렁이가 필요하다.
 테스트 케이스에 대해 필요한 최소의 배추흰지렁이 마리 수를 출력해라.

 0은 배추없는 땅이고, 1은 배추다
 1    1    0    0    0    0    0    0    0    0
 0    1    0    0    0    0    0    0    0    0
 0    0    0    0    1    0    0    0    0    0
 0    0    0    0    1    0    0    0    0    0
 0    0    1    1    0    0    0    1    1    1
 0    0    0    0    1    0    0    1    1    1

 입력
 첫 줄: 테스트 케이스의 개수 T가 주어진다.
 그 다음 줄부터 ~ T번 반복:
    - 첫째 줄: 배추밭 가로 M(1 ≤ M ≤ 50) / 세로 N(1 ≤ N ≤ 50) / 배추 개수 K(1 ≤ K ≤ 2500)
    - 그 다음 ~ K줄:  배추의 위치 X(0 ≤ X ≤ M-1), Y(0 ≤ Y ≤ N-1)가 주어진다.
 --------------------------------------------------------------------------------
 풀이

 bfs
  가로가 width, 세로가 length일 때 
 */

import Foundation

let testCases: Int = Int(readLine()!)!

var field: [[Int]] = []
var widthMax: Int = 0
var lengthMax: Int = 0

var jireongeeCount: Int = 0

for _ in 0..<testCases {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let targetCount: Int = input[2]

    widthMax = input[0]
    lengthMax = input[1]
    field = Array(repeating: Array(repeating: 0, count: widthMax), count:lengthMax)

    for _ in 0..<targetCount {
        let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
        field[input[1]][input[0]] = 1             //   배추로 주어주는 (x, y)값이 x행 y열이아닌 y행 x열이라 앞에 index1, 뒤에 index0이 들어감
    }                                             //   => 뒤에서도 배추밭 접근 시 (x, y)면 fied[y][x]로 접근

    for x in 0..<widthMax {
        for y in 0..<lengthMax {
            bfs(x: x, y: y)
        }
    }

    print(jireongeeCount)
    jireongeeCount = 0
}

func bfs(x: Int, y: Int) {

    guard field[y][x] == 1 else {
        return
    }

    let xMove: [Int] = [1, -1, 0, 0]
    let yMove: [Int] = [0, 0, 1, -1]

    var stack: [(x: Int, y: Int)] = [(x: x, y: y)]
    field[y][x] = 0
    jireongeeCount += 1

    while !stack.isEmpty {
        let xy = stack.removeLast()

        for index in 0..<4 {
            let xy2: (x: Int, y: Int) = (x: xy.x + xMove[index], y: xy.y + yMove[index])
            if xy2.x < widthMax && xy2.x >= 0 && xy2.y < lengthMax && xy2.y >= 0 && field[xy2.y][xy2.x] == 1 {  // x,y 아니고 xy2.x랑  xy2.y로 체크하기
                field[xy2.y][xy2.x] = 0               // if문 내부도 x,y 아니고 xy2.x랑  xy2.y로 사용하기 ..!
                stack.append((x: xy2.x, y: xy2.y))
            }
        }
    }
}
