//230430_체육복_프로그래머스

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 바로 앞번, 뒷번에만 체육복 빌려주기 가능
    // reserve와 lost 모두 속할 수 있음.
    
    var array: [Int] = Array(repeating: 1, count: n)
    
    for item in reserve {
        array[item - 1] += 1
    }
    
    for item in lost {
        array[item - 1] -= 1
    }
    
    for index in 0..<array.count {
        if array[index] == 0 {
            if index > 0 && array[index - 1] == 2 {     // 앞에 순서 먼저해야함
                array[index - 1] = 1
                array[index] = 1
            } else if index < array.count - 1 && array[index + 1] == 2 {
                array[index + 1] = 1
                array[index] = 1
            }
        }
    }
    
    var answer = 0
    for item in array {
        if item > 0 {
            answer += 1
        }
    }
    
    return answer
}
