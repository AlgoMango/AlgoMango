//230511_두큐합같게만들기_프로그래머스

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var que1 = queue1
    var que2 = queue2
    let totalSum = queue1.reduce(0, +) + queue2.reduce(0, +)
    
    var count = 0
    var index1 = 0
    var index2 = 0
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    
    if totalSum % 2 == 1 { return -1 }
    
    while sum1 != totalSum / 2 {
        // 한바퀴돌았는데도 안되면 -1 Return 
        if index1 >= queue1.count + queue2.count { return -1 }
        
        count += 1
        if sum1 < totalSum / 2 {
            sum1 += que2[index2]
            sum2 -= que2[index2]
            que1.append(que2[index2])
            index2 += 1
            continue
        }
        
        if sum2 < totalSum / 2 {
            sum2 += que1[index1]
            sum1 -= que1[index1]
            que2.append(que1[index1])
            index1 += 1
            continue
        }
    }
    
    return count
}
