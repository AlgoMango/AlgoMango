// https://leetcode.com/problems/island-perimeter

/*
 문제이해
 grid 0은 물, 1은 땅, 땅이모인 섬의 외곽 둘레길이구하기
 ------------------------------------------------------------------------------------
 풀이
 4개에서 주변 본인과 붙어있는 갯수 확인해서 1개면 4-1=3개 더하고, 네군데 다 붙어있으면 4-4=0개 더해가면서..!
 */

func islandPerimeter(_ grid: [[Int]]) -> Int {
    let row = grid.count
    let col = grid.first!.count
    var answer: Int = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: col) ,count: row)

    for (x, line) in grid.enumerated() {
        for (y, cell) in line.enumerated() {
            dfs(x: x, y: y)
        }
    }

    func dfs(x: Int, y: Int) {
        guard grid[x][y] == 1, !visited[x][y] else { return }

        let xMove: [Int] = [0, 0, 1, -1]
        let yMove: [Int] = [1, -1, 0, 0]
        var sideCount: Int = 0

        var stack: [(x: Int, y: Int)] = [(x: x, y: y)]
        visited[x][y] = true

        while !stack.isEmpty {
            let xy = stack.removeLast()
            var linking: Int = 0

            for idx in 0..<4 {
                let (x2, y2) = (xy.x + xMove[idx], xy.y + yMove[idx])

                guard (0..<row) ~= x2 && (0..<col) ~= y2 && grid[x2][y2] == 1 else { continue }

                linking += 1

                guard !visited[x2][y2] else { continue } // visited로 return 되지않게 붙어있는 갯수 확인하는 linking 더한 후에 체크하기

                stack.append((x: x2, y:y2))
                visited[x2][y2] = true
            }

            sideCount += 4 - linking
        }

        answer += sideCount
    }

    return answer
}
