import Foundation

let length = Int(readLine()!)!

var graph: [[Int]] = []
var visit: [[Int]] = Array(repeating: Array(repeating: 0, count: length), count: length)
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]
var results: [Int] = []

for _ in 1...length {
    let input = readLine()!.map { Int(String($0))! }
    
    graph.append(input)
}

for i in 0..<length {
    for j in 0..<length {
        if graph[i][j] == 1 && visit[i][j] == 0 {
            visit[i][j] = 1
            bfs(start: (i, j))
        }
    }
}

func bfs(start: (Int, Int)) {
    var index = 0
    var count = 1
    var needVisitQueue: [(Int, Int)] = [start]
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= length || yPosition < 0 || yPosition >= length {
                continue
            }
            
            if visit[xPosition][yPosition] == 1 {
                continue
            }
            
            if graph[xPosition][yPosition] == 1 {
                needVisitQueue.append((xPosition, yPosition))
                visit[xPosition][yPosition] = 1
                count += 1
            }
        }
    }
    
    results.append(count)
}

print(results.count)
results.sorted(by: <).forEach {
    print($0, terminator: "\n")
}
