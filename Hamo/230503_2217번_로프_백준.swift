import Foundation

let count = Int(readLine()!)!
var ropes: [Int] = []
var maxWeight: Int = 0

for _ in 1...count {
    let input = Int(readLine()!)!
    ropes.append(input)
}

ropes = ropes.sorted(by: <)

for i in 1...count {
    let weight = i * ropes[ropes.count - i]
    
    maxWeight = max(maxWeight, weight)
}

print(maxWeight)
