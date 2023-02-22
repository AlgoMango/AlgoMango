import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [Int] = priorities
    var indices: [Int] = Array(0...priorities.count - 1)
    var maxes: [Int] = queue.sorted(by: >)
    var answer: Int = 1
    var cur: Int = 0
    
    while true {
        if queue[cur] == maxes.first! {
            if indices[cur] == location { break }
            cur += 1
            answer += 1
            maxes.removeFirst()
        } else {
            queue.append(queue[cur])
            indices.append(indices[cur])
            cur += 1
        }
    }

    return answer
}
