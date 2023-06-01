//230602_2개이하로다른비트_프로그래머스
import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    // x보다 크고 x와 비트가 1~2개 다른 수들 중에서 제일 작은 수를 구하는 것
    
    var answer: [Int64] = []
    for number in numbers {
        var newNumber: [String] = String(number, radix: 2).map { String($0) }
        
        if number == 0 {
            answer.append(1)
            continue
        }
        // 짝수면 , 1 1 0
        if number % 2 == 0 {
            newNumber[newNumber.count - 1] = "1"
        } else { // 홀수 1 1 1, 1 0 1 1
            var change = false
            for index in (0..<newNumber.count).reversed() {
                // 제일 마지막의 0을 1로 변경  1011 -> 1111
                if newNumber[index] == "0" {
                    change = true
                    newNumber[index] = "1"
                    
                    // 마지막보다 앞의 1을 0으로 변경 1111 -> 1101
                    for index2 in index+1..<newNumber.count {
                        if newNumber[index2] == "1" {
                            newNumber[index2] = "0"
                            break
                        }
                    }
                    break
                }
            }
            
            if !change {
                newNumber[0] = "0"
                newNumber.insert("1", at: 0)
            } 
        }
        answer.append(Int64(newNumber.joined(), radix:2)!)
    }
    
    return answer
}
