//230508_오픈채팅방_프로그래머스
import Foundation

func solution(_ record:[String]) -> [String] {
    
    var dict: [String:String] = [:]
    // 들어올때 바꿀 수 있고, 변경해도 뜬다.
    
    for rec in record { 
        var input = rec.split(separator: " ").map { String($0) }
        if input[0] == "Leave" { continue }
        
        dict[input[1]] = input[2]
    }
    
    var answer: [String] = []
    for rec in record { 
        var input = rec.split(separator: " ").map { String($0) }
        
        switch input[0] {
            case "Enter":
                answer.append("\(dict[input[1]]!)님이 들어왔습니다.")
            case "Leave":
                answer.append("\(dict[input[1]]!)님이 나갔습니다.")
            default:
                continue
        }
    }
    
    return answer
}
