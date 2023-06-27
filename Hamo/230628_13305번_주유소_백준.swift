// 00 : 20 ~ 00 : 48
// 개어려웠음
import Foundation

let cityCount = Int(readLine()!)!
let roadLength: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var cost = readLine()!.split(separator: " ").map { Int($0)! }
cost.removeLast()

var minCost = cost[0]
var result = roadLength[0] * minCost

for index in 1..<roadLength.count {
    minCost = min(minCost, cost[index])
    result += roadLength[index] * minCost
}

print(result)
