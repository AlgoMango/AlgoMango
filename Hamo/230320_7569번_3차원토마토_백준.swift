import Foundation

let farms = readLine()!.split(separator: " ").map { Int($0)! }

let width = farms[0]
let height = farms[1]
let count = farms[2]

let dxdy: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, -1), (0, 1), (0, 0), (0, 0)]
let dz = [0, 0, 0, 0, 1, -1]

var graph: [[[Int]]] = []
var visits: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: width), count: height), count: count)
var start: [(Int, Int, Int)] = []

for _ in 1...count {
    var temp: [[Int]] = []
    
    for _ in 1...height {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        temp.append(input)
    }
    
    graph.append(temp)
}

for z in 0..<count {
    for x in 0..<height {
        for y in 0..<width {
            if graph[z][x][y] == 1 {
                start.append((x, y, z))
            } else if graph[z][x][y] == -1 {
                visits[z][x][y] = -1
            }
        }
    }
}

bfs(start: start)

func bfs(start: [(x: Int, y: Int, z: Int)]) {
    var needVisitQueue: [(x: Int, y: Int, z: Int)] = start
    var index = 0
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1

        for (xy, z) in zip(dxdy, dz) {
            let xPosition = currentNode.x + xy.x
            let yPosition = currentNode.y + xy.y
            let zPosition = currentNode.z + z

            if xPosition < 0 || xPosition >= height || yPosition < 0 || yPosition >= width {
                continue
            }
            
            if zPosition < 0 || zPosition >= count {
                continue
            }
            
            if visits[zPosition][xPosition][yPosition] != 0 {
                continue
            }
            
            if graph[zPosition][xPosition][yPosition] == 0 {
                visits[zPosition][xPosition][yPosition] = 1
                graph[zPosition][xPosition][yPosition] = graph[currentNode.z][currentNode.x][currentNode.y] + 1
                needVisitQueue.append((xPosition, yPosition, zPosition))
            }
        }
    }
}

let results = graph.flatMap { $0 }.flatMap { $0 }

if results.contains(0) {
    print(-1)
} else {
    print(results.max()! - 1)
}
