import Foundation

//커서 위치를 기준으로 스택 분리 & popLast 활용

var letters = readLine()!.map { String($0) }
let inputCount = Int(readLine()!)!
var commands: [String] = []
var stack: [String] = []

for _ in 1...inputCount {
    let command = readLine()!
    
    commands.append(command)
}

for command in commands {
    switch command {
    case "L":
        guard let letter = letters.popLast() else { continue }
        
        stack.append(letter)
    case "D":
        guard let letter = stack.popLast() else { continue }
        
        letters.append(letter)
    case "B":
        letters.popLast()
    default:
        letters.append(command.last!.description)
    }
}

let result = (letters + stack.reversed()).joined()

print(result)
