import Foundation

let dxdy: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1), (0, 0), (0, 0)]
let dz: [Int] = [0, 0, 0, 0, 1, -1]
var results: [String] = []

while true {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let floor = info[0]
    let height = info[1]
    let width = info[2]
    var startLocation: (Int, Int, Int)?
    var graph: [[[(String, Int)]]] = []
    var visits: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: width), count: height), count: floor)
    var result = 0
    
    func bfs(start: (x: Int, y: Int, z: Int)) {
        var needVisitQueue: [(x: Int, y: Int, z: Int)] = [start]
        var index = 0
        var isFind = false
        
        while index < needVisitQueue.count && !isFind {
            let currentNode = needVisitQueue[index]
            index += 1
            
            for (xy, z) in zip(dxdy, dz) {
                let xPosition = currentNode.x + xy.0
                let yPosition = currentNode.y + xy.1
                let zPosition = currentNode.z + z
                
                if xPosition < 0 || xPosition >= height || yPosition < 0 || yPosition >= width {
                    continue
                }
                
                if zPosition < 0 || zPosition >= floor {
                    continue
                }
                
                if graph[zPosition][xPosition][yPosition].0 == "#" {
                    continue
                }
                
                if visits[zPosition][xPosition][yPosition] == 1 {
                    continue
                }
                
                if graph[zPosition][xPosition][yPosition].0 == "." {
                    needVisitQueue.append((xPosition, yPosition, zPosition))
                    visits[zPosition][xPosition][yPosition] = 1
                    graph[zPosition][xPosition][yPosition].1 = graph[currentNode.z][currentNode.x][currentNode.y].1 + 1
                } else if graph[zPosition][xPosition][yPosition].0 == "E" {
                    result = graph[currentNode.z][currentNode.x][currentNode.y].1 + 1
                    isFind.toggle()
                }
            }
        }
    }
    
    if floor == 0 && height == 0 && width == 0 {
        break
    }
    
    for z in 0..<floor {
        var temp: [[(String, Int)]] = []
        for x in 0..<height {
            let input = readLine()!.map { (String($0), 0) }
            if let y = input.firstIndex(where: { $0.0 == "S"}) {
                startLocation = (z, x, y)
            }

            temp.append(input)
        }
        
        readLine()!
        graph.append(temp)
    }
    
    visits[startLocation!.0][startLocation!.1][startLocation!.2] = 1
    bfs(start: (startLocation!.1, startLocation!.2, startLocation!.0))
    
    if result == 0 {
        results.append("Trapped!")
    } else {
        results.append("Escaped in \(result) minute(s).")
    }
}

results.forEach { print($0) }
