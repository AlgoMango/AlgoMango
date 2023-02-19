//230219_기능개발_프로그래머스
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var workDay: [Int] = []

    for index in 0..<progresses.count {
        var work = progresses[index]
        var day = 0
        while work < 100 {
            work += speeds[index]
            day += 1
        }
        workDay.append(day)
    }
    
    var result: [Int] = []
    var maxDay = 0
    var index = 0
    
    for day in workDay {
        if maxDay >= day { // 10, 10이면 같이 배포되어야 한다.
            result[index-1] += 1
        } else {
            result.append(1)
            index += 1
            maxDay = day
        }
    }
    
    return result
}
