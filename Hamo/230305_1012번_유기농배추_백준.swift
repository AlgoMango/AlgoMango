import Foundation

let testCaseCount = Int(readLine()!)!
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]
var results: [String] = []

for _ in 1...testCaseCount {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let width = input[0]
    let height = input[1]
    let cabbageCount = input[2]
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    var result = 0
    
    func bfs(graph: [[Int]], start: (Int, Int)) {
        var needVisitLeft: [(Int, Int)] = [start]
        var needVisitRight: [(Int, Int)] = []

        while !needVisitLeft.isEmpty {
            let currentNode = needVisitLeft.removeLast()

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
                    needVisitRight.append((xPosition, yPosition))
                    visits[xPosition][yPosition] = 1
                }
                
                if needVisitLeft.isEmpty {
                    needVisitLeft = needVisitRight.reversed()
                    needVisitRight.removeAll()
                }
            }
        }
    }
    
    for _ in 1...cabbageCount {
        let locations = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        graph[locations[1]][locations[0]] = 1
    }
    
    for i in 0..<height {
        for j in 0..<width {
            if visits[i][j] == 1 || graph[i][j] == 0 {
                continue
            }
        
            bfs(graph: graph, start: (i, j))
            result += 1
        }
    }
    
    results.append(String(result))
}

print(results.joined(separator: "\n"))
