import Foundation

let map = readLine()!.split(separator: " ").map { Int($0)! }
let width = map[1]
let height = map[0]

let row = [1, 0, -1, 0]
let column = [0, 1, 0, -1]

var graph: [[Int]] = []
var visits = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: width), count: height)

for _ in 1...height {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

visits[0][0][0] = 1
var needVisitQueue: [(row: Int, column: Int, busugi: Int)] = [(0, 0, 0)]
var index = 0
var result = -1

while index < needVisitQueue.count {
    let currentNode = needVisitQueue[index]
    index += 1

    let currentRow = currentNode.row
    let currentColumn = currentNode.column
    let currentBusugi = currentNode.busugi

    if currentRow == height - 1 && currentColumn == width - 1 {
        result = visits[currentRow][currentColumn][currentBusugi]
        break
    }

    for (row, column) in zip(row, column) {
        let checkRow = currentRow + row
        let checkColumn = currentColumn + column

        guard (0..<height) ~= checkRow && (0..<width) ~= checkColumn else {
            continue
        }

        guard visits[checkRow][checkColumn][currentNode.busugi] == 0 else {
            continue
        }

        if graph[checkRow][checkColumn] == 0 {
            visits[checkRow][checkColumn][currentBusugi] = visits[currentRow][currentColumn][currentBusugi] + 1
            needVisitQueue.append((checkRow, checkColumn, currentBusugi))

        } else if currentBusugi == 0 {
            visits[checkRow][checkColumn][1] = visits[currentRow][currentColumn][currentBusugi] + 1
            needVisitQueue.append((checkRow, checkColumn, 1))
        }
    }
}

print(result)
