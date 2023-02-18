import Foundation

let commandCount = Int(readLine()!)!
var commands: [String] = []
var stack: [String] = []

for _ in 1...commandCount {
    let command = readLine()!
    commands.append(command)
}

for command in commands {
    switch command {
    case "pop":
        guard let pop = stack.popLast() else {
            print("-1")
            continue
        }
        print(pop)
        
    case "size":
        print(stack.count)
        
    case "empty":
        let num = stack.isEmpty ? 1 : 0
        print(num)
        
    case "top":
        guard let top = stack.last else {
            print("-1")
            continue
        }
        print(top)
        
    default:
        let element = command.components(separatedBy: " ")[1]
        stack.append(element)
    }
}
