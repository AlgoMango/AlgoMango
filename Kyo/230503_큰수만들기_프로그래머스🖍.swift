//230503_큰수만들기_프로그래머스
/*
testcase 8,9,10 시간초과..
*/

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    var numberArray = number.map { String($0) } 
    
    var startIndex = 0
    var indexLimit = k
    var answer = ""
    
    while indexLimit < numberArray.count {
        if answer.count == numberArray.count - startIndex {
            answer += numberArray[startIndex..<numberArray.count].joined()
            return answer
        }
        
        var maxNumber = numberArray[startIndex..<indexLimit+1].max()!
        
        answer += maxNumber
        
        for index in startIndex..<indexLimit+1 {
            if numberArray[index] == maxNumber {
                startIndex = index + 1
                indexLimit += 1
                break
            }
        }
    }
    
    return answer
}
