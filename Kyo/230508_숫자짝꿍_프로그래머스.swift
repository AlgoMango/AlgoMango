//230508_숫자짝꿍_프로그래머스
import Foundation

func solution(_ X:String, _ Y:String) -> String {
/*    
    short : 0 1 1 4
    long : 0 1 2 3 3 
*/  
    var dictX: [String:Int] = [:]
    var dictY: [String:Int] = [:]
    
    for item in X.map { String($0) } {
        if dictX[item] == nil {
            dictX[item] = 1
            continue
        }
        dictX[item]! += 1
    }
    
    for item in Y.map { String($0) } {
        if dictY[item] == nil {
            dictY[item] = 1
            continue
        }
        dictY[item]! += 1
    }
    
    var answer: [String] = []
    for key in dictX.keys {
        answer += Array(repeating: key, count: min(dictX[key] ?? 0, dictY[key] ?? 0))
    }
    
    if answer.isEmpty { return "-1"} 
    
    answer.sort(by: >)
    if answer[0] == "0" { return "0"}
    
    return answer.joined()
}
