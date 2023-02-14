//230214_5397키로거_백준

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let input = readLine()!.map { String($0) }
    
    var left: [String] = []
    var right: [String] = []
    
    for index in 0..<input.count {
        
        switch input[index] {
        case "<":
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        case ">":
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        case "-":
            if !left.isEmpty {
                left.removeLast()
            }
        default:
            left.append(input[index])
        }
    }
    
    print(left.joined() + right.reversed().joined())
}


