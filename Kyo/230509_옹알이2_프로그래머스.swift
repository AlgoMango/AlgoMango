//230509_옹알이2_프로그래머스
import Foundation

func solution(_ babbling:[String]) -> Int {
    
    var bab = babbling 
    var answer = 0
    
    for index in 0..<bab.count {
        var flag = true

        // 연속 발음 불가
        if bab[index].contains("ayaaya") || 
            bab[index].contains("yeye") || 
            bab[index].contains("woowoo") || 
            bab[index].contains("mama") { 
                flag = false 
            }
        
        while flag {
            flag = false
            
            if bab[index].contains("aya") {
                flag = true
                bab[index] = bab[index].replacingOccurrences(of: "aya", with: "@")
            }
            
            if bab[index].contains("ye") {
                flag = true
                bab[index] = bab[index].replacingOccurrences(of: "ye", with: "@")
            }
            
            if bab[index].contains("woo") {
                flag = true
                bab[index] = bab[index].replacingOccurrences(of: "woo", with: "@")
            }
            
            if bab[index].contains("ma") {
                flag = true
                bab[index] = bab[index].replacingOccurrences(of: "ma", with: "@")
            }
            
        }
        
        var count = 0 
        for item in bab[index].map { String($0) } {
            if item == "@" {
                count += 1
            }
        }
        
        if bab[index] == Array(repeating: "@", count: count).joined() {
            answer += 1
        }
    }
    return answer
}
