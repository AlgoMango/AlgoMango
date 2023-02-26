//230226_3986좋은단어_백준

let testCase = Int(readLine()!)!

var result = 0
for _ in 0..<testCase {
    
    let input: [String] = readLine()!.map { String($0) }
    var stack: [String] = []
    
    for index in 0..<input.count {
        if !stack.isEmpty && input[index] == stack.last! {
            stack.removeLast()
            continue
        }
        
        stack.append(input[index])
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)
