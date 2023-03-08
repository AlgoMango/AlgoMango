//230308_타겟넘버_프로그래머스
// 재귀 안쓰고 우찌 푸나...

import Foundation

var answer = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    recursiveAdd(numbers, target, 0, 0)
    return answer
}

func recursiveAdd(_ numbers: [Int], _ target: Int, _ index: Int, _ result: Int) {
    if index == numbers.count {
        if result == target {
            answer += 1
        }
        return 
    }
    
    recursiveAdd(numbers, target, index + 1, result + numbers[index])
    recursiveAdd(numbers, target, index + 1, result - numbers[index])
}
