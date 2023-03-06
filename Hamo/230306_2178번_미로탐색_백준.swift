import Foundation

let miro = readLine()!.components(separatedBy: " ").map { Int($0)! }
let rowCount = miro[0]
let columnCount = miro[1]
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: columnCount), count: rowCount)
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: columnCount), count: rowCount)

for index in 0..<rowCount {
    let column = readLine()!.map { Int(String($0))! }
    
    graph[index] = column
}

visits[0][0] = 1
bfs()

print(graph[rowCount - 1][columnCount - 1])

func bfs() {
    var visitNodeCount: Int = 1
    var needVisitQueue: [(Int, Int)] = [(0, 0)]
    
    while !needVisitQueue.isEmpty {
        let currentNode = needVisitQueue.removeFirst()
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition == (rowCount - 1) && yPosition == (columnCount - 1) {
                if graph[xPosition][yPosition] == 1 {
                    graph[xPosition][yPosition] += graph[currentNode.0][currentNode.1]
                } else if graph[xPosition][yPosition] > 1 {
                    if graph[xPosition][yPosition] > (graph[currentNode.0][currentNode.1] + 1) {
                        graph[xPosition][yPosition] = graph[currentNode.0][currentNode.1] + 1
                    }
                }
                
                break
            }
            
            if xPosition < 0 || xPosition >= rowCount || yPosition < 0 || yPosition >= columnCount {
                continue
            }
            
            if visits[xPosition][yPosition] == 1 {
                continue
            }
            
            if graph[xPosition][yPosition] >= 1 {
                visits[xPosition][yPosition] = 1
                needVisitQueue.append((xPosition, yPosition))
                graph[xPosition][yPosition] += graph[currentNode.0][currentNode.1]
            }
        }
    }
}
