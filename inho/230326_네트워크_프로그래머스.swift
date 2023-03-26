//https://school.programmers.co.kr/learn/courses/30/lessons/43162

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var result = 0
    
    func dfs(_ m: Int) {
        guard !visited[m] else { return }
        
        var stack = [m]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            let graph = computers[node]
            
            visited[node] = true
            
            for index in 0..<n {
                guard index != node else { continue }
                
                if graph[index] == 1, !visited[index] {
                    stack.append(index)
                }
            }
        }
        
        result += 1
    }
    
    (0..<n).forEach { dfs($0) }
    
    return result
}
