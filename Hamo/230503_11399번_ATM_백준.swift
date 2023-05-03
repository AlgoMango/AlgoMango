import Foundation

let N = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var time = 0
var results: [Int] = []

for index in 0..<N {
    time += times[index]
    results.append(time)
}

print(results.reduce(0, +))
