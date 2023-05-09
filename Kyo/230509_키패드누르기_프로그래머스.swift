//230509_키패드누르기_프로그래머스
import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var leftCuurent = "*"
    var rightCuurent = "#"
    
    var numbers = numbers.map { String($0) }
    
    for number in numbers {
        if ["1", "4", "7"].contains(number) {
            answer += "L"
            leftCuurent = number
        }
        
        if ["3", "6", "9"].contains(number) {
            answer += "R"
            rightCuurent = number
        }
        
        if ["2", "5", "8", "0"].contains(number) {
            var result = checkDistance(left: leftCuurent, right: rightCuurent, target: number, hand)       
            
            if result == "R" {  rightCuurent = number }
            if result == "L" { leftCuurent = number }
            
            answer += result
        }
    }
    return answer
}

func checkDistance(left: String, right: String, target: String, _ hand: String) -> String {
    var keyPad = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["*", "0", "#"]]
    var targetLoc: (Int, Int) = (0, 0)
    var leftLoc: (Int, Int) = (0, 0)
    var rightLoc: (Int, Int) = (0, 0)
    
    for index in 0..<4 {
        for index2 in 0..<3 {
            if keyPad[index][index2] == left { leftLoc = (index, index2)}
            if keyPad[index][index2] == right { rightLoc = (index, index2)}
            if keyPad[index][index2] == target { targetLoc = (index, index2)}
        }
    }
    
    var ld = abs(leftLoc.0 - targetLoc.0) + abs(leftLoc.1 - targetLoc.1)
    var rd = abs(rightLoc.0 - targetLoc.0) + abs(rightLoc.1 - targetLoc.1)
    
    if ld == rd {
        if hand == "right" { return "R"}
        if hand == "left" { return "L"}
    } 
    
    if ld > rd { return "R"}
    else { return "L" }
}
