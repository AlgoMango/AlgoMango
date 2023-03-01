//230301_5430AC_백준

// 계속 틀림.. 반례 해봣는디

let testCase = Int(readLine()!)!


for _ in 0..<testCase {
    // Input
    let command = readLine()!.map { String($0) }
    let count = Int(readLine()!)!
    let numbersInput = readLine()!.map { String($0) }
    
    var number: [Int] = []
    
    for num in numbersInput {
        guard let num = Int(num) else { continue }
        number.append(num)
    }
    
    var flag = true
    
    // R인지
    var commandStack: [String] = []
    
    var left = 0
    var right = number.count-1
    
    
    for com in command {
        switch com {
        case "R":
            if !commandStack.isEmpty && commandStack.first! == "R" {
                commandStack.removeLast()
            } else {
                commandStack.append("R")
            }
        case "D":
            // 만약 R인상태
            if left > right {
                flag = false
                break
            }
            
            if !commandStack.isEmpty && commandStack.first! == "R" {
                right -= 1
            } else {
                left += 1
            }
        default:
            continue
        }
    }
    
    if flag == false {
        print("error")
        continue
    } else if left > right {
        print("[]")
        continue
    }
    
    if !commandStack.isEmpty && commandStack.first! == "R" {
        let temp = number[left...right].reversed().map { String($0) }.joined(separator: ",")
        print("[" + temp + "]")
    } else {
        let temp = number[left...right].map { String($0) }.joined(separator: ",")
        print("[" + temp + "]")
    }
}
