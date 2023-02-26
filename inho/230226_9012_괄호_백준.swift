func solution() {
    let count = Int(readLine()!)!
    var inputs: [String] = []
    
    for _ in 1...count {
        inputs.append(readLine()!)
    }
    
    for input in inputs {
        var stack: [Character] = []
        
        input.forEach {
            if $0 == ")" {
                if stack.isEmpty {
                    stack.append($0)
                } else if stack.last! == "(" {
                    stack.removeLast()
                } else {
                    return
                }
            } else {
                stack.append($0)
            }
        }
        
        print(stack.isEmpty ? "YES" : "NO")
    }
}

solution()
