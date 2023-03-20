import Foundation

let size = readLine()!.split(separator: " ").map { Int($0)! }
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

let height = size[0]
let width = size[1]

var graph: [[(String, Int)]] = []
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)

var jihoonLocation: (Int, Int) = (0, 0)
var start: [(Int, Int)] = []
var resultLocation: (Int, Int)?
var isEnd: Bool = false

for _ in 1...height {
    let input = readLine()!.map { (String($0), 0) }
    
    graph.append(input)
}

for i in 0..<height {
    for j in 0..<width {
        if graph[i][j].0 == "F" {
            visits[i][j] = 1
            start.append((i, j))
        }
        
        if graph[i][j].0 == "J" {
            visits[i][j] = 1
            jihoonLocation = (i, j)
        }
    }
}

if jihoonLocation.0 == 0 || jihoonLocation.0 == height - 1 || jihoonLocation.1 == 0 || jihoonLocation.1 == width - 1 {
    print(1)
    exit(0)
}

start.append(jihoonLocation)

bfs()

if let resultLocation = resultLocation {
    print(graph[resultLocation.0][resultLocation.1].1 + 1)
} else {
    print("IMPOSSIBLE")
}


func bfs() {
    var needVisitQueue: [(Int, Int)] = start
    var index = 0
    
    while index < needVisitQueue.count && !isEnd {
        let currentNode = needVisitQueue[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= height || yPosition < 0 || yPosition >= width {
                continue
            }
            
            if graph[xPosition][yPosition].0 == "#" {
                continue
            }
            
            if visits[xPosition][yPosition] == 1 {
                continue
            }
            
            if graph[xPosition][yPosition].0 == "." {
                needVisitQueue.append((xPosition, yPosition))
                if graph[currentNode.0][currentNode.1].0 == "F" {
                    graph[xPosition][yPosition].0 = "F"
                    graph[xPosition][yPosition].1 = graph[currentNode.0][currentNode.1].1 + 1
                } else {
                    graph[xPosition][yPosition].0 = "G"
                    graph[xPosition][yPosition].1 = graph[currentNode.0][currentNode.1].1 + 1
                    
                    if xPosition == 0 || xPosition == height - 1 || yPosition == 0 || yPosition == width - 1 {
                        resultLocation = (xPosition, yPosition)
                        isEnd.toggle()
                        break
                    }
                }
            }
        }
    }
}
