func solution() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let height = input[0], width = input[1]
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
    var count = 0
    var max = 0
    
    func dfs(_ i: Int,_  j: Int, _ area: inout Int) {
        guard i >= 0 && i < height && j >= 0 && j < width else { return } 
        
        if graph[i][j] == 1 {
            guard visited[i][j] == false else { return } //방문한 노드이면 탈출
            
            area += 1
            visited[i][j] = true
            dfs(i - 1, j, &area) //재귀로 한 노드의 4방향 탐색
            dfs(i + 1, j, &area)
            dfs(i, j + 1, &area)
            dfs(i, j - 1, &area)
        }
    }
    
  // 입력을 이중배열(그림)로 변환
    for i in 0..<height {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        for j in 0..<input.count {
            if input[j] == 1 {
                graph[i][j] = 1
            }
        }
        /* 
         [1, 1, 0, 1, 1]
         [0, 1, 1, 0, 0]
         [0, 0, 0, 0, 0]
         ...
        */
    }
    
  // 모든 점들에 대해서 dfs 호출
    for i in 0..<height {
        for j in 0..<width {
            var tempArea = 0
            
            dfs(i, j, &tempArea)
            
            if tempArea > 0 {
                count += 1
            }
            if tempArea > max {
                max = tempArea
            }
        }
    }
    
    print(count, max, separator: "\n")
}

solution()
