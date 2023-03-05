import Foundation

let input = readLine()!.components(separatedBy: " ")
let height = Int(input[0])!
let width = Int(input[1])!
var graph: [[Int]] = Array(repeating: [], count: height)
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
var dx: [Int] = [1, 0, -1, 0]
var dy: [Int] = [0, 1, 0, -1]

var imageCount: Int = 0
var maxWidth: Int = 0

for index in 0..<height {
    let column = readLine()!.components(separatedBy: " ").map { Int($0)! }
    graph[index] = column
}

for i in 0..<height {
    for j in 0..<width {
        if visits[i][j] == 1 || graph[i][j] == 0 {
            continue
        }
        
        let result = bfs(graph: graph, start: (i, j))
        if result > 0 {
            imageCount += 1
        }
        
        if result > maxWidth {
            maxWidth = result
        }
    }
}

print(imageCount)
print(maxWidth)

func bfs(graph: [[Int]], start: (Int, Int)) -> Int {
    var visitNodeCount: Int = 1
    var needVisitQueue: [(Int, Int)] = [start]
    
    while !needVisitQueue.isEmpty {
        let currentNode = needVisitQueue.removeFirst()
        visits[currentNode.0][currentNode.1] = 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= height || yPosition < 0 || yPosition >= width {
                continue
            }
            
            if visits[xPosition][yPosition] == 1 {
                continue
            }
            
            if graph[xPosition][yPosition] == 1 {
                needVisitQueue.append((xPosition, yPosition))
                visits[xPosition][yPosition] = 1
                visitNodeCount += 1
            }
        }
    }
    
    return visitNodeCount
}
