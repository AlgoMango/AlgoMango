import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var copyProgresses = progresses
    var copySpeeds = speeds
    var success: [Int] = []
    var stack: [Int] = []
    var results: [Int] = []
    
    while !copyProgresses.isEmpty && !copySpeeds.isEmpty {
        let progress = copyProgresses.removeLast()
        let speed = copySpeeds.removeLast()
        
        let result = ceil(Double(100 - progress) / Double(speed))
        success.append(Int(result))
    }

    while !success.isEmpty {
        stack.append(success.removeLast())
        
        if (!success.isEmpty) && (success.last! <= stack.reversed().last!) {
            continue
        } else {
            results.append(stack.count)
            stack.removeAll()
        }
    }
    
    return results
}
