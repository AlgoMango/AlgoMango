import Foundation

let passwordCount: Int = Int(readLine()!)!
var passwords: [String] = []
var rightTexts: [String] = []
var leftTexts: [String] = []
var results: [String] = []

for _ in 0..<passwordCount {
    let input = readLine()!
    passwords.append(input)
}

for password in passwords {
    password.forEach { text in
        switch text {
        case "<":
            guard let last = leftTexts.popLast() else {
                break
            }
            
            rightTexts.append(last)
        case ">":
            guard let last = rightTexts.popLast() else {
                break
            }
            
            leftTexts.append(last)
        case "-":
            leftTexts.popLast()
        default:
            leftTexts.append(String(text))
        }
    }
    
    let resultPassword = leftTexts + rightTexts.reversed()
    results.append(resultPassword.joined())
    
    leftTexts.removeAll()
    rightTexts.removeAll()
}

results.forEach { print($0) }
