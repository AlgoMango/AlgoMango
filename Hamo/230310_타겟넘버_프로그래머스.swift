import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var count: Int = 0
    
    func dfs(depth: Int, sum: Int) {
        if depth == numbers.count {
            if sum == target {
                count += 1
            }
            
            return
        }
        
        dfs(depth: depth + 1, sum: sum + numbers[depth])
        dfs(depth: depth - 1, sum: sum + numbers[depth])
    }
    
    dfs(depth: 0, sum: 0)
    
    return count
}
