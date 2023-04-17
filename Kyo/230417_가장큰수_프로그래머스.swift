//230417_가장큰수_프로그래머스
import Foundation

func solution(_ numbers:[Int]) -> String {
    var tempNumbers = numbers
    
    tempNumbers.sort { numberA, numberB in
        return String(numberA) + String(numberB) > String(numberB) + String(numberA)
    }
    
    // [0,0] 일경우 "0" 리턴
    if tempNumbers.first! == 0 { return "0" }
    
    return tempNumbers.map { String($0) }.joined()
}
