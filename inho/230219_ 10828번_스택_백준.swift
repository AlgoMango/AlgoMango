import Foundation

let count = Int(readLine()!)!
var commands: [String] = []
var result: [Int] = []

for _ in 1...count {
    let command = readLine()!
    
    commands.append(command)
}

for command in commands {
    switch command {
    case "top":
        print(result.isEmpty ? -1 : result.last!)
    case "size":
        print(result.count)
    case "empty":
        print(result.isEmpty ? 1 : 0)
    case "pop":
        print(result.isEmpty ? -1 : result.removeLast())
    default:
        result.append(Int(command.components(separatedBy: " ")[1])!)
    }
}
