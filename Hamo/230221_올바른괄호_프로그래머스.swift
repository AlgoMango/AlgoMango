import Foundation

func solution(_ s:String) -> Bool {
    var stack: [Character] = []

    if (s.count % 2) != 0 {
        return false
    }
    
    for bracket in s.reversed() {
        if bracket == ")" {
            stack.append(bracket)
        } else if stack.isEmpty && bracket == "(" {
            return false
        } else {
            stack.popLast()
        }
    }
    
    if stack.isEmpty {
        return true
    } else {
        return false
    }
}
