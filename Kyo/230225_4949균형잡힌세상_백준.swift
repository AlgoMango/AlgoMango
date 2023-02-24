//230225_4949균형잡힌세상_백준
// 막풀어서 더티..

while true {
    let input = readLine()!.map { String($0) }
    
    if input.count == 1 && input[0] == "." { break }
    var stack: [String] = []
    var flag = true
    
    for index in 0..<input.count {
        if input[index] == "(" {
            stack.append(input[index])
        } else if input[index] == ")" {
            if !stack.isEmpty && stack.last! == "(" {
                stack.removeLast()
            } else {
                print("no")
                flag = false
                break
            }
        }
        
        if input[index] == "[" {
            stack.append(input[index])
        } else if input[index] == "]" {
            if !stack.isEmpty && stack.last! == "[" {
                stack.removeLast()
            } else {
                print("no")
                flag = false
                break
            }
        }
    }
    
    if stack.isEmpty && flag {
        print("yes")
    } else if !stack.isEmpty && flag {
        print("no")
    }
}
