import Foundation

let bingshin = readLine()!.split(separator: " ").map { Int($0)! }
let height = bingshin[0]
let width = bingshin[1]
var bingshinCount = 0
var year = 0

var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

var graph: [[(Int, Int)]] = []
var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)

for _ in 1...height {
    let input = readLine()!.split(separator: " ").map { (Int($0)!, 0) }
    
    graph.append(input)
}
var isBingshin = true

while bingshinCount < 2 && isBingshin {
    bingshinCount = 0
    isBingshin = false
    for i in 0..<height {
        for j in 0..<width {
            if graph[i][j].0 > 0 && visits[i][j] == 0 {
                isBingshin = true
                visits[i][j] = 1
                bfs(start: (i, j))
            }
        }
    }
    
    year += 1
    visits = Array(repeating: Array(repeating: 0, count: width), count: height)
}

if isBingshin {
    print(year - 1)
} else {
    print(0)
}

func bfs(start: (Int, Int)) {
    bingshinCount += 1
    var needVisitQueue: [(Int, Int)] = [start]
    var index = 0
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        graph[currentNode.0][currentNode.1].1 = 0
        // 다음 탐색때는 바껴야됨 이거 하니까 정답 히히히히히
        index += 1
        
        for (x, y) in zip(dx, dy) {
            let xPosition = currentNode.0 + x
            let yPosition = currentNode.1 + y
            
            if xPosition < 0 || xPosition >= height || yPosition < 0 || yPosition >= width {
                continue
            }
            
            if visits[xPosition][yPosition] == 1 {
                continue
            }
            
            if graph[xPosition][yPosition].0 <= 0 {
                graph[currentNode.0][currentNode.1].1 += 1
            } else if graph[xPosition][yPosition].0 > 0 {
                needVisitQueue.append((xPosition, yPosition))
                visits[xPosition][yPosition] = 1
            }
        }
        
        graph[currentNode.0][currentNode.1].0 -= graph[currentNode.0][currentNode.1].1
    }
}
