func solution(_ s:String) -> Int {
    var stack = Array(s)
    var result = 0
    
    for _ in 1...stack.count {
        stack.append(stack.removeFirst())
        var stackOne: [Character] = []
        
        for item in stack {
            switch item {
            case "(", "{", "[":
                stackOne.append(item)
            case ")":
                if let last = stackOne.last, last == "(" {
                    stackOne.removeLast()
                } else {
                    stackOne.append(item)
                }
            case "}":
                if let last = stackOne.last, last == "{" {
                    stackOne.removeLast()
                } else {
                    stackOne.append(item)
                }
            case "]":
                if let last = stackOne.last, last == "[" {
                    stackOne.removeLast()
                } else {
                    stackOne.append(item)
                }
            default:
                break
            }
        }
        
        if stackOne.isEmpty {
            result += 1
        }
    }
        
    return result
}
