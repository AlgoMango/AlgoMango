import Foundation

let buildingCount = Int(readLine()!)!
var buildings: [Int] = []
var buildingStack: [Int] = []
var results: [Int] = []
var buildingSights: [Int] = Array(repeating: 0, count: buildingCount)

for _ in 1...buildingCount {
    let building = Int(readLine()!)!
    
    buildings.append(building)
}

var cache: [Int] = buildings

for index in 0..<buildingCount {
    while !buildingStack.isEmpty {
        if buildings[index] >= buildings[buildingStack.last!] {
            buildingSights[buildingStack.removeLast()] = index
        } else {
            break
        }
    }
    
    buildingStack.append(index)
}

for index in 0..<cache.count {
    let sight = buildingSights[index]

    if sight == 0 {
        results.append(cache.count - (index + 1))
    } else {
        results.append(sight - (index + 1))
    }
}

print(results.reduce(0, +))
