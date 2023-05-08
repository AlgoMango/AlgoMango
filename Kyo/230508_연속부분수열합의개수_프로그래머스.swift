//230508_연속부분수열합의개수_프로그래머스

import Foundation

func solution(_ elements:[Int]) -> Int {
    // 7 9 1 1 4 7 9 1 1 4
    
    var answer: Set<Int> = []
    
    var newElements = elements + elements
    
    for index in 0..<elements.count {
        var total = 0
        for size in 0..<elements.count {
            total += newElements[index + size]
            answer.insert(total)
        }
    }
    
    return answer.count
}
