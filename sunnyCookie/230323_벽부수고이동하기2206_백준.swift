//https://www.acmicpc.net/problem/2206

/*
 문제이해
 N×M의 행렬지오에서 0은 이동가능, 1은 이동불가 벽이다.
 (1, 1)에서 (N, M)까지 최단 경로로 이동하려 한다(시작하는 칸과 끝나는 칸도 포함해서 카운팅)
 만약에 이동하는 도중에 한 개의 벽을 부수고 이동하는 것이 좀 더 경로가 짧아진다면, 벽을 한 개 까지 부수고 이동하여도 된다.
 최단거리 출력, 불가능할 때는 -1출력
 --------------------------------------------------------------------------------
 풀이

 1. ❌ input받으면서 벽 배열 만들어서 하나씩 0으로 만들면서 최단거리 진행(stack에선 removeFisrt대신 index로 진행) -> 메모리 초과
 2. ❌ 1번에서 stack을 queue로 구현해서 removeLast()이용 -> 메모리초과
 3. ✅ stack에 (x,y,step,부순벽Count) 담아가며 진행
        Bool값 이중배열인 visited 사용을 벽을 한번 부수고 온 길에서따로 체크할수있도록 또다른 Bool값 이중배열 BreakedVisited 사용
        (왜냐면, 벽을 한 번 부수고 온 애가 visited처리해놓은 길을, 0만 따라온 애가 visited 처리되서 못들리는 경우 방지)

 */

import Foundation

// 인풋받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (row, column) = (input[0], input[1])
var map: [[Int]] = []

for _ in 0..<row {
    let rowInput = Array(readLine()!).map { Int(String($0))! }
    map.append(rowInput)
}

// 방문확인을 0(길)만 따라간애가 방문하는길과, 벽을 한번 부순애가 방문하는곳을 구분
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row) // 길만 따라가는애가 방문
var BreakedVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row) // 벽 한번 부순애가 방문
var minStep: Int = -1
var enqueue: [(x: Int, y: Int, step: Int, wallCount: Int)] = [(x: 0, y: 0, step: 1, wallCount: 0)] // (0,0) 넣고 시작
var dequeue: [(x: Int, y: Int, step: Int, wallCount: Int)] = []
visited[0][0] = true

let xMove: [Int] = [-1, 1, 0, 0]
let yMove: [Int] = [0, 0, -1, 1]

while !enqueue.isEmpty || !dequeue.isEmpty {
    if dequeue.isEmpty {
        dequeue = enqueue.reversed()
        enqueue.removeAll()
    }

    let xy = dequeue.removeLast()

    // 도착지인지 확인
    if xy.x == row - 1 && xy.y == column - 1 {
        minStep = (minStep == -1) ?  xy.step : min(xy.step, minStep) // minStep이 -1이면 현재step넣어주고, 아니면 비교해서 작은 값 담기
        continue
    }

    for i in 0..<4 {
        let (x2, y2, step2) = (xy.x + xMove[i], xy.y + yMove[i], xy.step + 1)
        var wallCount2 = xy.wallCount

        // 인덱스가 맥의 내부인지 확인
        guard (0..<row) ~= x2 && (0..<column) ~= y2 else { continue }

        // (1)지금 벽인지 확인한 후, 벽이아니면 지금까지 (2)벽을뚫은적있는지, (3)없는지 분기
        if map[x2][y2] == 1 {
            // 만난게 벽이면 그동안 벽 부순적 없어야하고 방문한적도 없어야함
            guard wallCount2 != 1 && !BreakedVisited[x2][y2] && !visited[x2][y2] else { continue }
            wallCount2 += 1
            enqueue.append((x: x2, y: y2, step: step2, wallCount: wallCount2))
            BreakedVisited[x2][y2] = true
        } else if wallCount2 == 1 {
            // 만난게 벽이 아니고 길일 때 벽부수고 온적있으면, 벽부순애들이 방문한적 없어야함
            guard !BreakedVisited[x2][y2] else { continue }
            enqueue.append((x: x2, y: y2, step: step2, wallCount: wallCount2))
            BreakedVisited[x2][y2] = true
        } else if wallCount2 == 0 {
            // 만난게 벽 아니고 길일 때 벽 부순 적 없으면, 벽 안부순 애들이 방문한 적 없어야 함
            guard !visited[x2][y2] else { continue }
            enqueue.append((x: x2, y: y2, step: step2, wallCount: wallCount2))
            visited[x2][y2] = true
        }
    }
}

print(minStep)
