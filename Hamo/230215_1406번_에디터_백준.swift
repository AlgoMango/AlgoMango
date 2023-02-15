import Foundation

var initialTexts = readLine()!.map { String($0) }
let commandCount: Int = Int(readLine()!)!

var editorStack: [String] = []

for _ in 0..<commandCount {
    let command = readLine()!.last!
    
    if command == "L" {
        guard let text = initialTexts.popLast() else {
            continue
        }
        
        editorStack.append(text)
        
    } else if command == "D" {
        guard let text = editorStack.popLast() else {
            continue
        }
        
        initialTexts.append(text)
    } else if command == "B" {
        initialTexts.popLast()
    } else {
        initialTexts.append(String(command))
    }
}

let result = initialTexts + editorStack.reversed()

print(result.joined())
