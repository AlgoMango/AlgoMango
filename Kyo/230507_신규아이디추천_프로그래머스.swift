//230507_신규아이디추천_프로그래머스

import Foundation

func solution(_ new_id:String) -> String {
    var specialLetter = "-_.1234567890abcdefghijklmnopqrstuvwxyz".map { String($0) }
    
    // 1 단계 + 2 단계
    var id = new_id.map { String($0).lowercased }.filter { return specialLetter.contains($0) }
    
    // 3 단계
    var comma = 0
    
    for index in 0..<id.count {
        if id[index] == "." {
            comma += 1
        } else {
            comma = 0
        }
        
        if comma == 2 {
            id[index] = "@"
            comma = 1
        }
    }
    
    id = id.filter { return specialLetter.contains($0) }
    
    //4단계 
    if id.count > 0 && id[0] == "." { id.removeFirst() }
    if id.count > 0 && id[id.count - 1] == "." { id.removeLast() }
    
    // 5단계 
    if id.isEmpty { id = ["a"] }
    
    // 6 단계
    if id.count > 15 { id = Array(id[0..<15]) }
    if id.count > 0 && id[id.count - 1] == "." { id.removeLast() }
    
    // 7 단계
    if id.count < 3 {
        while id.count < 3 {
            id.append(id.last!)
        }
    }
    
    return id.joined()
}
