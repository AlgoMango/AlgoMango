import Foundation

let size = Int(readLine()!)!
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var graph: [[Int]] = []
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: size), count: size)
var results: [Int] = []

for _ in 1...size {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph.append(input)
}

let maxHeight = graph.flatMap { $0 }.max()!

for height in 0..<maxHeight {
    var count = 0
    for i in 0..<size {
        for j in 0..<size {
            if graph[i][j] > height && visits[i][j] == 0 {
                visits[i][j] = 1
                bfs(start: (i, j), height: height)
                count += 1
            }
        }
    }
    
    results.append(count)
    
    visits = Array(repeating: Array(repeating: 0, count: size), count: size)
}

print(results.max()!)

func bfs(start: (Int, Int), height: Int) {
    var needVisitQueue: [(Int, Int)] = [start]
    var index = 0
    
    while index != needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= size || yPosition < 0 || yPosition >= size {
                continue
            }
            
            if visits[xPosition][yPosition] == 1 {
                continue
            }
            
            if graph[xPosition][yPosition] > height {
                visits[xPosition][yPosition] = 1
                needVisitQueue.append((xPosition, yPosition))
            }
        }
    }
}
