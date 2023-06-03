//230603_괄호회전하기_프로그래머스
import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var bracketArray = s.map { String($0) }
    var count = 0
    
    while count < bracketArray.count {
        if checkRight(bracketArray) {
            answer += 1
        } 
        
        var number = bracketArray.removeFirst()
        bracketArray.append(number)
        count += 1
    }
    
    return answer
}

func checkRight(_ s: [String]) -> Bool {
    var openChar: [String] = ["(", "{", "["]
    var stack: [String] = []
    
    for index in 0..<s.count {
        if openChar.contains(s[index]) { 
            stack.append(s[index])
            continue
        } 
        
        if stack.isEmpty { return false }
        
        if s[index] == ")" && stack.last! == "(" || 
            s[index] == "}" && stack.last! == "{" || 
            s[index] == "]" && stack.last! == "[" {
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? true : false
}
