func solution(_ priorities:[Int], _ location:Int) -> Int {
    var index = location
    var stack = priorities
    var result = 1
    
    while true {
        if stack.first! == stack.max()! {
            stack.removeFirst()
            result += 1
            
            if index == 0 {
                break
            } else {
                index -= 1
            }
        } else {
            stack.append(stack.removeFirst())
            
            if index == 0 {
                index = stack.count - 1
            } else {
                index -= 1
            }
        }
    }
    
    return result
}
