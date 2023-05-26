import Foundation

func checkProperBracket(with bracket: String) -> Int {
    var temp = bracket.map { String($0) }
    var stack: [String] = []
    while !temp.isEmpty {
        guard let top = temp.popLast() else {
            break
        }
        
        if stack.isEmpty {
            stack.append(top)
        } else if top + stack.last! == "()" {
            stack.popLast()
        } else if top + stack.last! == "{}" {
            stack.popLast()
        } else if top + stack.last! == "[]" {
            stack.popLast()
        } else {
            stack.append(top)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

func solution(_ s: String) -> Int {
    guard s.count % 2 == 0 else {
        return 0
    }

    var tempS = s
    var result = 0

    result += checkProperBracket(with: s)

    for _ in 1..<s.count {
        tempS += String(tempS.removeFirst())
        result += checkProperBracket(with: tempS)
    }

    return result
}
