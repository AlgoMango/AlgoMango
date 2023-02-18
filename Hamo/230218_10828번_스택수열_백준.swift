import Foundation

let count = Int(readLine()!)!
var initialArray: [Int] = Array(1...count).reversed()
var sequence: [Int] = []
var numberStack: [Int] = []

var results: [String] = []

for _ in 1...count {
    let number = Int(readLine()!)!
    
    sequence.append(number)
}

sequence = sequence.reversed()

while !sequence.isEmpty {
    let sequenceTop = sequence.last
    
    if sequenceTop == numberStack.last {
        sequence.popLast()
        numberStack.popLast()
        results.append("-")
        continue
    } else if !initialArray.isEmpty {
        numberStack.append(initialArray.popLast()!)
        results.append("+")
    } else {
        print("NO")
        break
    }
}

if numberStack.isEmpty {
    for element in results {
        print(element)
    }
}
