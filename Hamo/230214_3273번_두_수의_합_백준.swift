import Foundation

let sizeOfSequence = Int(readLine()!)!
let sequence = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
let resultValue = Int(readLine()!)!

var start = 0
var end = sizeOfSequence - 1

var result = 0

while start != end {
    let currentPointValue = sequence[start] + sequence[end]
    
    if currentPointValue == resultValue {
        result += 1
        start += 1
    } else if currentPointValue > resultValue {
        end -= 1
    } else if currentPointValue < resultValue {
        start += 1
    }
}

print(result)
