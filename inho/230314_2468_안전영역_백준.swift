//https://www.acmicpc.net/problem/2468

func solution() {
    let count = Int(readLine()!)!
    var graph = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: count), count: count)
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var results: [Int] = []

    func dfs(i: Int, j: Int, max: Int) -> Bool {
        guard graph[i][j] > max, !visited[i][j] else { return false }
        
        visited[i][j] = true
        
        for index in 0...3 {
            let next = (i + dx[index], j + dy[index])
        
            if next.0 < 0 || next.0 == count || next.1 < 0 || next.1 == count { continue }
            
            dfs(i: next.0, j: next.1, max: max)
        }
        
        return true
    }
    
    for _ in 1...count {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph.append(input)
    }
    
    Set(graph.flatMap { $0 }).forEach {
        var result = 0
        
        for i in 0..<count {
            for j in 0..<count {
                if dfs(i: i, j: j, max: $0) {
                    result += 1
                }
            }
        }
        
        visited = Array(repeating: Array(repeating: false, count: count), count: count)
        results.append(result)
    }
    
    print(results.max()! != 0 ? results.max()! : 1) //모든 지역이 안잠기면 전체가 하나의 안전영역
}

solution()
