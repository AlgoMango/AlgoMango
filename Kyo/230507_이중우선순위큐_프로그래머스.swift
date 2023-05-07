//230507_이중우선순위큐_프로그래머스
import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var queue: [Int] = []
    
    for operation in operations {
        let input = operation.split(separator: " ").map { String($0) }
        var op = input[0]
        var number = Int(input[1])!
        
        switch op {
            case "I":
                queue.append(number)
            case "D":
                if queue.count == 0 { continue }
                if number == 1 {
                    let index = queue.firstIndex(of: queue.max()!)
                    queue.remove(at: index!)
                } else {
                    let index = queue.firstIndex(of: queue.min()!)
                    queue.remove(at: index!)
                }
            default: 
                continue
        }   
    }
    
    if queue.count == 0 { return [0, 0] }
    
    return [queue.max()!, queue.min()!]    
}
