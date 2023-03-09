// 앞으로 components 쓰면 
import Foundation

let farm = readLine()!.split(separator: " ")
let farmWidth = Int(farm[0])!
let farmHeight = Int(farm[1])!
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var start: [(Int, Int)] = []
var index: Int = 0

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: farmWidth), count: farmHeight)
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: farmWidth), count: farmHeight)

for index in 0..<farmHeight {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[index] = input
}

for i in 0..<farmHeight {
    for j in 0..<farmWidth {
        if graph[i][j] == 0 {
            continue
        } else if graph[i][j] == -1 {
            visits[i][j] = -1
            continue
        }
        
        visits[i][j] = 1
        start.append((i, j))
    }
}

bfs(start: start)

let results = visits.flatMap({ $0 })

if results.contains(0) {
    print("-1")
} else {
    print(results.max()! - 1)
}

func bfs(start: [(Int, Int)]) {
    var needVisitQueue: [(Int, Int)] = start
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= farmHeight || yPosition < 0 || yPosition >= farmWidth {
                continue
            }
            
            if visits[xPosition][yPosition] != 0 {
                continue
            }
            
            if graph[xPosition][yPosition] == 0 {
                needVisitQueue.append((xPosition, yPosition))
                visits[xPosition][yPosition] = visits[currentNode.0][currentNode.1] + 1
            }
        }
    }
}

// 풀이 2
import Foundation

let farm = readLine()!.split(separator: " ").map { Int($0)! }
let farmWidth = farm[0]
let farmHeight = farm[1]

var graph = Array(repeating: Array(repeating: 0, count: farmWidth), count: farmHeight)
var needVisitQueue: [(Int, Int)] = []
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]
var index = 0
var result = 0

for index in 0..<farmHeight {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[index] = input
}

for i in 0..<farmHeight {
    for j in 0..<farmWidth {
        if graph[i][j] == 1 {
            needVisitQueue.append((i, j))
        }
    }
}

while index != needVisitQueue.count  {
    let currentNode = needVisitQueue[index]
    index += 1
    
    for i in 0...3 {
        let xPosition = currentNode.0 - dx[i]
        let yPosition = currentNode.1 - dy[i]
        
        if xPosition < 0 || xPosition >= farmHeight || yPosition < 0 || yPosition >= farmWidth {
            continue
        }
        
        if graph[xPosition][yPosition] == 0 {
            needVisitQueue.append((xPosition, yPosition))
            graph[xPosition][yPosition] = graph[currentNode.0][currentNode.1] + 1
            if result < graph[xPosition][yPosition] {
                result = graph[xPosition][yPosition]
            }
        }
    }
}

for i in 0..<farmHeight {
    if graph[i].contains(0) {
        result = 0
    }
}

print(result - 1)
