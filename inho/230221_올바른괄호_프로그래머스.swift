func solution(_ s:String) -> Bool {
    var stack: [Character] = []
    
    s.forEach {
        if $0 == "(" {
            stack.append("(")
        } else {
            if stack.isEmpty { //빠른 탈출
                stack.append(")")
                return
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty
}
