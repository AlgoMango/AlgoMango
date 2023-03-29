// https://school.programmers.co.kr/learn/courses/30/lessons/84021
/*
 테이블 위에 놓인 퍼즐 조각을 게임 보드의 빈 공간에 끼우기.(조각 회전가능, 뒤집을순없음, 새로 채워 넣은 퍼즐 조각과 인접한 칸이 비어있으면 안 됩니다.)
 ------------------------------------------------------------------------------------
 풀이
 dfs로 빈곳, 조각 확인하기. 이 때 빈곳과 조각을 0.0 기준에 붙여주고 순서 xy순서 sorting해주기
 퍼즐 90도 돌리면서 끼우기 -> 90도 돌리는법: (x, y) -> (-y, x)
 */

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    let n = game_board.count
    var answer: Int = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count:n), count: n)

    // dfs 돌면서 도형의 첫번째 xy를 (0,0)로 만든 후 return (한 개의 도형을 도출)
    func dfs(map: [[Int]], target: Int, x: Int, y: Int) -> [(x: Int, y: Int)]? {
        guard map[x][y] == target,
              visited[x][y] == false else { return nil }

        let xMove: [Int] = [0, 0, 1, -1]
        let yMove: [Int] = [1, -1, 0, 0]
        var stack: [(x: Int, y: Int)] = [(x: x, y: y)]
        var idx: Int = 0
        visited[x][y] = true

        while idx < stack.count {
            let (xVal, yVal) = (stack[idx].x, stack[idx].y)

            for moveIdx in 0..<4 {
                let (x2, y2) = (xVal + xMove[moveIdx], yVal + yMove[moveIdx])
                guard (0..<n) ~= x2 && (0..<n) ~= y2 else { continue }
                guard map[x2][y2] == target && !visited[x2][y2] else { continue }

                stack.append((x: x2, y:y2))
                visited[x2][y2] = true
            }

            idx += 1
        }

        // 도형을 (0,0)기준으로 붙이면서 모든조각 xy가 음수를 갖지 않도록 조정
        let minusX = stack.first!.x - 0
        let minusY = stack.first!.y - 0

        stack = stack.map { (x: $0.x - minusX, y: $0.y - minusY) } // 첫번째 값을 0으로
        var sIdx: Int = 0

        while sIdx < stack.count { // ✅ for piece in Stack 일 경우 반복 중 변경되는 stack 반영을 못해서 index로 접근해야함
            let piece = stack[sIdx]

            if piece.x < 0 {
                stack = stack.map { (x: $0.x - piece.x , y: $0.y) }
            }

            if piece.y < 0 {
                stack = stack.map { (x: $0.x, y: $0.y - piece.y) }
            }
            sIdx += 1
        }

        stack.sort(by: <) // 퍼즐조각과 비교할 때 순서가 맞아야해서 순서 정렬
        return stack
    }

    var voidPlaces: [[(x: Int, y: Int)]] = []
    var puzzles: [[(x: Int, y: Int)]] = []

    // 게임보드의 빈 곳(퍼즐모양)담기 -> visited 초기화 -> 테이블의 puzzle 담기
    for x in 0..<n {
        for y in 0..<n {
            if let voidPlace = dfs(map: game_board, target: 0, x: x, y: y) {
                voidPlaces.append(voidPlace)
            }
        }
    }

    visited = Array(repeating: Array(repeating: false, count:n), count: n)

    for x in 0..<n {
        for y in 0..<n {
            if let puzzle = dfs(map: table, target: 1, x: x, y: y) {
                puzzles.append(puzzle)
            }
        }
    }

    //도형 90도만 돌리기 -> 돌린 후 (0,0)기준으로 붙이면서 모든조각 xy가 음수를 갖지 않도록 조정
    func rotatePuzzle(_ puzzle: [(x: Int, y: Int)]) -> [(x: Int, y: Int)] {
        var rotated = puzzle.map { (x: -$0.y, y: $0.x) }
        var rIdx: Int = 0

        // 첫번째 조각을 (0,0)으로 만들기
        rotated = rotated.map { (x: $0.x - rotated.first!.x, y: $0.y - rotated.first!.y) }

        while rIdx < rotated.count { // ✅ for piece in rotated 일 경우 반복 중 변경되는 stack 반영을 못해서 index로 접근해야함
            let piece = rotated[rIdx]

            if piece.x < 0 {
                rotated = rotated.map { (x: $0.x - piece.x , y: $0.y) }
            }

            if piece.y < 0 {
                rotated = rotated.map { (x: $0.x, y: $0.y - piece.y) }
            }

            rIdx += 1
        }

        rotated.sort(by: <) // 퍼즐조각과 비교할 때 순서가 맞아야해서 순서 정렬

        return rotated
    }

    var puzzleVisited: [Bool] = Array(repeating: false, count: puzzles.count)

    // 보드의 빈곳과 퍼즐을 비교해 answer에 담기
    for voidPlace in voidPlaces {
        var flag: Bool = false // 퍼즐조각을 바꿔서 껴보기 전에 빈곳이 이미 퍼즐로 채워졌는지 확인하는 flag

        for (pIdx, puzzle) in puzzles.enumerated() {
            guard !flag else { break } // 빈 구역에 퍼즐이 채워져있지 않음을 확인
            guard voidPlace.count == puzzle.count, !puzzleVisited[pIdx] else { continue } // 빈구역과 퍼즐의 xy갯수가 갖고, 이미 사용한 퍼즐이 아님확인

            // 퍼즐을 90도씩 4번 돌리면서 넣어볼거임..
            var rotatedPuzzle = puzzle

            for _ in 0..<4 {
                var same: Int = 0

                for (idx, piece) in voidPlace.enumerated() { // 빈곳xy와 퍼즐xy 같은지확인

                    if piece.x == rotatedPuzzle[idx].x && piece.y == rotatedPuzzle[idx].y {
                        same += 1
                    }
                }

                if same == voidPlace.count { // 같은갯수가 조각의 모든 xy갯수와 같으면 똑같은 모양 = 퍼즐을 끼울 수 있음.
                    answer += voidPlace.count
                    flag = true
                    puzzleVisited[pIdx] = true
                    break
                }

                rotatedPuzzle = rotatePuzzle(rotatedPuzzle) // 아니면 회전~
            }
        }
    }

    return answer
}
