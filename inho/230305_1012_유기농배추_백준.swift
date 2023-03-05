func solution() {
    let testCase = Int(readLine()!)!
        
    for _ in 1...testCase {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        let width = input[0], height = input[1]
        var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
        var count = 0
        
        func dfs(_ i: Int, _ j: Int, isCabbage: inout Bool) {
            guard i >= 0, i < height, j >= 0, j < width else { return }
            
            if graph[i][j] == 1 {
                guard visited[i][j] == false else { return }
                
                visited[i][j] = true
                isCabbage = true
                dfs(i+1, j, isCabbage: &isCabbage)
                dfs(i-1, j, isCabbage: &isCabbage)
                dfs(i, j+1, isCabbage: &isCabbage)
                dfs(i, j-1, isCabbage: &isCabbage)
            }
        }
        
        for _ in 1...input[2] {
            let index = readLine()!.components(separatedBy: " ").map { Int($0)! }

            graph[index[1]][index[0]] = 1
        }
        
        for i in 0..<height {
            for j in 0..<width {
                var flag = false
                
                dfs(i, j, isCabbage: &flag)
                
                if flag {
                    count += 1
                }
            }
        }
        
        print(count)
    }
}

solution()
