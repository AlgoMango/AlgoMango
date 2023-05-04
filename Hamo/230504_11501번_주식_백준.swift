import Foundation

let count = Int(readLine()!)!
var results: [Int] = []

for _ in 1...count {
    _ = Int(readLine()!)!
    
    let cost: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.reversed()
    var max = cost.first!
    var benefit = 0
    
    for index in 1..<cost.count {
        if cost[index] < max {
            benefit += max - cost[index]
        } else {
            max = cost[index]
        }
    }
    
    results.append(benefit)
}

results.forEach {
    print($0)
}
