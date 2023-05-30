// 시작 13:20
import Foundation

var parentheses: [Character] = []
var answer: Int = 0

func solution(_ s:String) -> Int {
    parentheses = Array(s)
    
    for index in 0..<parentheses.count {
        let arr: [Character] = index == 0 ? parentheses : Array(parentheses[index...]) + Array(parentheses[0..<index])
        if isValid(arr) { answer += 1 }
    }
    
    return answer
}

func isValid(_ arr: [Character]) -> Bool {
    var stack: [Character] = []
    
    for char in arr {
        if char == "(" || char == "{" || char == "[" {
            stack.append(char)
            continue
        }
        
        if stack.isEmpty { return false }
        
        if char == ")" && stack.last! == "(" {
            stack.removeLast()
            continue
        } else if char == "}" && stack.last! == "{" { 
            stack.removeLast()
            continue
        } else if char == "]" && stack.last! == "[" {
            stack.removeLast()
            continue
        } else { return false }
    }
    
            
    if stack.isEmpty { return true }
    return false
}
