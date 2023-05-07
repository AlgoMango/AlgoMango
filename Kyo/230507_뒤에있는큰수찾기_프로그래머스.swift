//230507_뒤에있는큰수찾기_프로그래머스
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var answer: [Int] = []
    var tempNumber = Array(numbers.reversed())
    var stack: [Int] = [1000001]
    
    for item in tempNumber {
        
        while stack.last! <= item {
            stack.removeLast()
        }
        
        answer.append(stack.last! == 1000001 ? -1 : stack.last!)
        stack.append(item)
    }
    
    return answer.reversed()
}
