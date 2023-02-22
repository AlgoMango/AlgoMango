import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    // 각 배포마다 배포되는 작업의 개수
    var works: [Int] = progresses
    var answer: [Int] = []
    var idx: Int = 0
    
    while idx < progresses.count {
        var today: Int = 0
        for i in 0..<works.count {
            works[i] += speeds[i]
        }
        
        while idx < progresses.count && works[idx] >= 100 {
            today += 1
            idx += 1
        }

        if today > 0 { answer.append(today) }
    }
    
    return answer
}
