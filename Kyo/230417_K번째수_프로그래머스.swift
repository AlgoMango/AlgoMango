//230417_K번째수_프로그래머스

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var answer: [Int] = []
    
    for index in 0..<commands.count {
        let start = commands[index][0] - 1
        let end = commands[index][1]
        var tempArray = Array(array[start..<end]).sorted(by: <)
        
        answer.append(tempArray[commands[index][2] - 1])
    }
    
    return answer
}
