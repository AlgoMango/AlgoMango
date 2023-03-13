import Foundation

let count = Int(readLine()!)!
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var saekmaengGraph: [[String]] = []
var saekmaengVisits: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
var saekmaengGroup: Int = 0
var jungsangGraph: [[String]] = []
var jungsangVisits: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
var jungsangGroup: Int = 0

for _ in 1...count {
    let input = readLine()!
    
    saekmaengGraph.append(input.replacingOccurrences(of: "G", with: "R").map { String($0) })
    jungsangGraph.append(input.map { String($0) })
}

for i in 0..<count {
    for j in 0..<count {
        if saekmaengVisits[i][j] == 0 {
            saekmaengVisits[i][j] = 1
            saekmaengBfs(target: saekmaengGraph[i][j], start: (i, j))
            saekmaengGroup += 1
        }
        
        if jungsangVisits[i][j] == 0 {
            jungsangVisits[i][j] = 1
            print("\(i), \(j)")
            jungsangBfs(target: saekmaengGraph[i][j], start: (i, j))
            jungsangGroup += 1
        }
    }
}

print("\(jungsangGroup) \(saekmaengGroup)")

func saekmaengBfs(target: String, start: (Int, Int)) {
    var needVisitNode: [(Int, Int)] = [start]
    var index = 0
    
    while index < needVisitNode.count {
        let currentNode = needVisitNode[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= count || yPosition < 0 || yPosition >= count {
                continue
            }
            
            if saekmaengVisits[xPosition][yPosition] == 1 {
                continue
            }
            
            if saekmaengGraph[xPosition][yPosition] == target {
                saekmaengVisits[xPosition][yPosition] = 1
                needVisitNode.append((xPosition, yPosition))
            }
        }
    }
}

func jungsangBfs(target: String, start: (Int, Int)) {
    var needVisitNode: [(Int, Int)] = [start]
    var index = 0
    
    while index < needVisitNode.count {
        let currentNode = needVisitNode[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= count || yPosition < 0 || yPosition >= count {
                continue
            }
            
            if jungsangVisits[xPosition][yPosition] == 1 {
                continue
            }
            
            if jungsangGraph[xPosition][yPosition] == target {
                jungsangVisits[xPosition][yPosition] = 1
                needVisitNode.append((xPosition, yPosition))
            }
        }
    }
}
