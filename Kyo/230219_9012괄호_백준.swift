//230219_9012괄호_백준

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let vpsInput = readLine()!.map { String($0) }
    
    if checkVPS1(input: vpsInput) {
   //if checkVPS2(input: vpsInput) {
        print("YES")
        continue
    }
    print("NO")
}

func checkVPS1(input: [String]) -> Bool {
    var stack: [String] = []
    for item in input {
        if item == "(" {
            stack.append(item)
        } else {
            if stack.isEmpty { return false }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? true : false
}

func checkVPS2(input: [String]) -> Bool {
    var flag = 0
    for item in input {
        if item == "(" {
            flag += 1
        } else {
            flag -= 1
        }
        if flag < 0 { return false }
    }
    
    return flag == 0 ? true : false
}
