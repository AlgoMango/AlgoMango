import Foundation

let towerCount = Int(readLine()!)!
var towers = readLine()!.components(separatedBy: " ").map { Int($0)! }
let cache = towers
var towerDictionary: [Int : String] = [:]
var stack: [Int] = []

var results: [String] = []

for element in towers {
    towerDictionary[element] = "0"
}


while !towers.isEmpty {
    guard var topTower = towers.popLast() else {
        break
    }
    
    if stack.isEmpty {
        stack.append(topTower)
        continue
    }
    
    while !stack.isEmpty {
        if topTower > stack.last! {
            let top = stack.removeLast()
            towerDictionary[top] = String(towers.count + 1)
        } else {
            break
        }
    }
    
    stack.append(topTower)
}

for element in cache {
    results.append(towerDictionary[element]!)
}

print(results.joined(separator: " "))
