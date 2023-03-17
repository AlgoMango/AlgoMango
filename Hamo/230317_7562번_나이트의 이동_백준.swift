import Foundation

let testCount = Int(readLine()!)!

let dx = [2, 2, -2, -2, 1, 1, -1, -1]
let dy = [1, -1, 1, -1, 2, -2, 2, -2]
var results: [Int] = []

for _ in 1...testCount {
    let line = Int(readLine()!)!
    var graph = Array(repeating: Array(repeating: 0, count: line), count: line)
    var visits = Array(repeating: Array(repeating: 0, count: line), count: line)
    
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let target = readLine()!.split(separator: " ").map { Int($0)! }
    
    var needVisitQueue: [(Int, Int)] = [(start[0], start[1])]
    var index = 0
    
    visits[start[0]][start[1]] = 1
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= line || yPosition < 0 || yPosition >= line {
                continue
            }
            
            if visits[xPosition][yPosition] != 0 {
                continue
            }
            
            graph[xPosition][yPosition] = graph[currentNode.0][currentNode.1] + 1
            needVisitQueue.append((xPosition, yPosition))
            visits[xPosition][yPosition] = 1
        }
        
        if visits[target[0]][target[1]] == 1 {
            let result = graph[target[0]][target[1]]
            results.append(result)
            break
        }
    }
}

results.forEach {
    print($0)
}
