//https://www.acmicpc.net/problem/7576

/*
 문제이해
    토마토를 보관하는 격자 모양 상자(가로 M * 세로 N)가 있다. 익은것과 안익은 토마토가 섞여있음.
    하루마다 익은 토마토들의 인접한 곳(왼쪽, 오른쪽, 앞, 뒤)에 있는 익지 않은 토마토들이 익은 토마토의 영향을 받아 익게 된다. (대각선은 영향 X)
    창고에 보관된 토마토들이 며칠이 지나면 다 익게 되는지, 그 최소 일수를 출력하는 문제
    (단, 격자 중 토마토가 없는 곳도 있음)

 입력
    첫 줄: 상자의 크기- 가로 M, 세로 N ( 2 ≤ M,N ≤ 1,000 )
    둘째 줄부터: 저장된 토마토들의 정보가 주어진다. 하나의 줄에는 상자 가로줄에 들어있는 토마토의 상태가 M개의 정수로 주어진다.
    (1: 익은 토마토, 0: 익지 않은 토마토, -1: 토마토 없는칸)
    토마토가 하나 이상 있는 경우만 입력으로 주어진다.

 출력
     토마토가 모두 익을 때까지의 최소 날짜를 출력해야 한다.
     만약, 저장될 때부터 모든 토마토가 익어있는 상태이면 0을 출력해야 하고,
     토마토가 모두 익지는 못하는 상황이면 -1을 출력해야 한다.
 --------------------------------------------------------------------------------
 풀이
 dfs만하면 시간초과나서 dfs + Queue로 품

 */

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let maxX: Int = input[1]
let maxY: Int = input[0]

var tomatoBox: [[(tomato: Int, day: Int)]] = Array(repeating: [], count: maxX) // [[], [], [], [] ...]

var enqueue: [(x: Int, y: Int, day: Int)] = []   // Queue 4, 5, 6
var dequeue: [(x: Int, y: Int, day: Int)] = []   //       3, 2, 1
var day: Int = 0

for x in 0..<maxX {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    for (y, tomato) in input.enumerated() {
        if tomato == 1 {
            dequeue.append((x: x, y: y, day: 0)) // input 받을 때, 1이면 queue에 담아줌
        }
        tomatoBox[x].append((tomato: tomato, day: 0))
    }
}

let xMove: [Int] = [0, 0, 1, -1]
let yMove: [Int] = [1, -1, 0, 0]

while !enqueue.isEmpty || !dequeue.isEmpty { // && 아니고 ||임..
    if dequeue.isEmpty { // dequeue에서 removeLast 하기전에 비어있으면 enqueue에서 가져옴
        dequeue = enqueue.reversed()
        enqueue.removeAll()
    }
    let xy2 = dequeue.removeLast()

    for index in 0..<4 {
        let x2 = xy2.x + xMove[index]
        let y2 = xy2.y + yMove[index]
        let day2 = xy2.day + 1

        if x2 >= 0 && y2 >= 0 && x2 < maxX && y2 < maxY && tomatoBox[x2][y2].tomato == 0 {
            enqueue.append((x: x2, y: y2, day: day2))
            tomatoBox[x2][y2].tomato = 1
            tomatoBox[x2][y2].day = day2
            day = day2
        }
    }
}

let isNoZero: Bool = tomatoBox.filter { $0.contains { $0.tomato == 0 } }.isEmpty // 값 출력 전 0 존재 확인
isNoZero ? print(day) : print(-1)
