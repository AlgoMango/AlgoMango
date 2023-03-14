//https://www.acmicpc.net/problem/2667

func solution() {
    let count = Int(readLine()!)!
    var graph: [[Int]] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: count), count: count)
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var result: [Int] = []
    
    func dfs(i: Int, j: Int, size: Int) -> Int {
        guard graph[i][j] == 1, !visited[i][j] else { return 0 }
        
        var area = size + 1
        visited[i][j] = true
        
        for index in 0...3 {
            let next = (i + dx[index], j + dy[index])
            
            if next.0 < 0 || next.0 == count || next.1 < 0 || next.1 == count { continue }
            
            let max = dfs(i: next.0, j: next.1, size: area)
            
            if max != 0 {
                area = max
            }
        }
        
        return area
    }
    
    for _ in 1...count {
        let input = Array(readLine()!).map { Int(String($0))! }
        
        graph.append(input)
    }
    
    for i in 0..<count {
        for j in 0..<count {
            let max = dfs(i: i, j: j, size: 0)
            
            if max != 0 {
                result.append(max)
            }
        }
    }
    
    print(result.count)
    result.sorted().forEach { print($0) }
}

solution()
