//https://school.programmers.co.kr/learn/courses/30/lessons/43164

func solution(_ tickets:[[String]]) -> [String] {
    let sortedTickets = tickets.sorted { $0[1] < $1[1] }
    var visited = Array(repeating: false, count: tickets.count)
    var result: [String] = []
    
    func dfs(from start: String) {
        guard result.count != tickets.count else {
            result.append(start)
            return
        }
        
        for i in 0..<tickets.count {
            let node = sortedTickets[i][0], next = sortedTickets[i][1]
            
            if start == node, !visited[i] {
                visited[i] = true
                result.append(node)
                dfs(from: next)
                
                if result.count == tickets.count + 1 {
                    return
                } else {
                    result.removeLast()
                    visited[i] = false
                }
            }
        }
    }
    
    dfs(from: "ICN")
    
    return result
}
