import Foundation

let count = Int(readLine()!)!

var rightStack: [Int] = Array(1...count).reversed()
var leftStack: [Int] = []
var trash: [Int] = []

while !rightStack.isEmpty || !leftStack.isEmpty {
    if rightStack.isEmpty {
        rightStack = leftStack.reversed()
        leftStack.removeAll()
    }
    
    let last = rightStack.removeLast()
    
    if trash.isEmpty {
        trash.append(last)
    } else {
        leftStack.append(last)
        trash.removeAll()
    }
}

print(trash.last!)
