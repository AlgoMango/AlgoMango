// https://www.acmicpc.net/problem/2573

/*
 문제이해
 북극의 빙산(2차원 배열)이 녹고 있다. 빙산높이가 양의 정수로 저장된다. 바다는 0이다.
 빙산의 높이는 바닷에 많이 접해있는 부분에서 더 빨리 줄어들기 때문에, 일년마다 빙하의 동서남북 네 방향의 0 개수만큼 줄어든다.
 한 덩어리의 빙산이 주어질 때, 이 빙산이 두 덩어리 이상으로 분리되는 최초의 시간(년)을 구하는 프로그램을 작성하시오.
 전부 다 녹을 때까지 두 덩어리 이상으로 분리되지 않으면 0을 출력

 --------------------------------------------------------------------------------
 풀이
 
 못 풀어서 물어볼거임 ^ㅡ^ㅠㅠ
 
 현재 미해결 풀이 방법:
    - input받을 때 얼음들의 좌표와 높이를 stack에 저장 -> ... -> 순회하면서 높이가 0되면 filter메서드로 stack에서 제거 
    - 1년 마다 얼음이 담긴 stack을 돌면서 사방 물 갯수 확인하고, 물 갯수만큼 얼음 높이를 내림 -> 
            높이 내린 후 현재 얼음 '덩어리' 갯수 확인 -> 
            두 덩어리 이상이면 몇년째인지 출력하고 끝 // 모두 녹았으면 0 출력하고 끝 // 
            앞에 둘 다 아니면 다음 해 진행 -> ..(반복)..
 */

import Foundation

// 인풋 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (row, column) = (input[0], input[1])

var sea: [[Int]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)
var ice: [(x: Int, y: Int, height: Int)] = []

for xValue in 0..<row {
    let line: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    sea.append(line)

    // 얼음들은 ice에 배열로 (x, y, 높이) 담아놓고, 바다면 visit = true로 방문처리
    for yValue in 0..<column {
        if line[yValue] > 0 { //
            ice.append((x: xValue, y: yValue, height: line[yValue]))
        } else {
            visited[xValue][yValue] = true
        }
    }
}

let xMove: [Int] = [0, 0, 1, -1]
let yMove: [Int] = [1, -1, 0, 0]

// stack에 ice담기
var stack:[(x: Int, y: Int, height: Int)] = ice
var index: Int = 0
var year: Int = 0

while true {
    year += 1

    // 얼음들이 담긴 stack돌면서 n년째의 주변 물갯수만큼 높이 내리기
    index = 0
    let seaCopy = sea // n년째의 바다 형태 복사해두기 (앞에서 녹아서 0이된 얼음이 같은해의 다른 얼음 녹는것에 영향끼치지않도록)

    while index < stack.count { // 얼음들이 담긴 stack 순회
        let (x, y, height) = (stack[index].x, stack[index].y, stack[index].height)
        var waterCount: Int = 0

        guard height != 0 else { // 이전 해에 높이가 0이된 얼음들은 안해도 됌
            index += 1
            continue
        }

        for i in 0..<4 {  // 좌 우 상 하 얼음갯수 확인
            let (x2, y2) = (x + xMove[i], y + yMove[i])

            guard (0..<row) ~= x2 && (0..<column) ~= y2 else { continue } // 바다 크기 내에 해당하는 x y인지 확인

            if seaCopy[x2][y2] == 0 { // Copy한 sea에서 확인해서 0 이면 water갯수 +1 해주기 (같은해에 녹아서 0된게 다른 얼음 녹는것에 영향끼치지않도록)
                waterCount += 1
            }
        }

        if height - waterCount > 0 { // 지금 높이에서 주변 물 개수만큼 뺐을 때 0보다 크면 높이 줄이기
            sea[x][y] -= waterCount // seaCopy말고 실제 sea에 적용
            stack[index].height -= waterCount // stack에 담긴 높이에도 적용
        } else {                   // 지금 높이에서 주변 물 개수만큼  뺐을 때 0보다 작으면 0 담기
            sea[x][y] = 0           // seaCopy말고 실제 sea에 적용
            stack[index].height = 0 // stack에 담긴 높이에도 적용
            visited[x][y] = true    // 0 됐으니까 visited 도 true 처ㄹ
        }

        index += 1 // index 추가하면서 모든 얼을들 순회 ( while index < stack.count )
    }

    index = 0 // 한바퀴 다 돌았으면 index 0

    // N년차의 이어져있는 얼음덩어리 개수확인
    var islandCount: Int = 0
    var visitedCopy = visited // 다음해에도 돌면서 써야하므로 복사한걸로 사용하기

    while index < stack.count { // 얼음들 담긴 stack 순회
        let (x, y) = (stack[index].x, stack[index].y) // 얼음의 좌표

        guard !visitedCopy[x][y] else { // 만약 올해에 0 이됐으면 위에서 visit = true 처리해줬으므로 안해도 됌
            index += 1
            continue
        }

        var bfsStack: [(x: Int, y: Int)] = [(x: x, y: y)] // bfs스택에 첫번재 얼음좌표 넣고 시작
        visitedCopy[x][y] = true // 복사한visited에 true처리
        islandCount += 1         // 몇개나 이어져있는지 모르지만 일단 첫 얼음이니까 덩어리갯수 +1

        while !bfsStack.isEmpty { // 이어져있는 얼음들은 stack에 담길것이므로 stack이 빌 때까지 1덩어리이므로 while로 반복
            let xy = bfsStack.removeLast()
            let (x, y) = (xy.x, xy.y)

            for i in 0..<4 { // 사방 확인, 얼음이면 이어진 덩어리로 볼것임
                let (x2, y2) = (x + xMove[i], y + yMove[i])

                guard (0..<row) ~= x2 && (0..<column) ~= y2 && sea[x2][y2] > 0 && !visitedCopy[x2][y2] else { continue }
                bfsStack.append((x: x2, y: y2)) // 이어진 덩어리면 stack에 넣고 visit처리
                visitedCopy[x2][y2] = true
            }
        }

        index += 1
    }

    if islandCount > 1 { // island가 2개 이상됐으면 year출력하고 끝
        print(year)
        exit(0)
    }

    stack = stack.filter { $0.height > 0 } // 얼음들 중 높이가 0이 된 (= 물이 된)건 빼주기

    if stack.isEmpty { // 다 뺐는데 얼음이 하나도 안남았으면 두덩어리가 될 수 없는 것이므로 0출력하고 끝
        print(0)
        exit(0)
    }
}
