//230220_10845큐_백준

let testCase = Int(readLine()!)!
var stack: [String] = []

for _ in 0..<testCase {
    let command = readLine()!
    
    switch command {
    case "front":
        print(stack.count == 0 ? "-1" : stack.first!)
    case "back":
        print(stack.count == 0 ? "-1" : stack.last!)
    case "empty":
        print(stack.isEmpty ? "1" : "0")
    case "size":
        print(stack.count)
    case "pop":
        print(stack.count == 0 ? "-1" : stack.removeFirst())
    default:
        let element = command.split(separator: " ").map { String($0) }[1]
        stack.append(element)
    }
}
