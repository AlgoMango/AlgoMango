//230506_n^2배열자르기_프로그래머스
import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    var answer: [Int] = []
    for index in Int(left)..<Int(right)+1 {
        let reminder = index % n    
        let value = index / n
        
        answer.append(max(value + 1, reminder + 1))
    }
    
    return answer
}
