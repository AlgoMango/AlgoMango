import Foundation

func checkFourBlock(graph: [[String]], current: (Int, Int), direction: [(row: Int, column: Int)]) -> [(Int, Int)] {
    let target = graph[current.0][current.1]
    
    var arr: [String] = []
    var coordinates: [(Int, Int)] = []
    
    for coordinate in direction {
        let row = current.0 + coordinate.row
        let column = current.1 + coordinate.column
        
        guard (0..<graph.count) ~= row else {
            continue
        }
        
        guard (0..<graph[0].count) ~= column else {
            continue
        }
        
        arr.append(graph[row][column])
        coordinates.append((row, column))
    }
    
    if arr.count == 3 && arr.allSatisfy({ $0 == target }) {
        return coordinates
    }
    
    return []
}

func dropBlock(graph: [[String]]) -> [[String]] {
    var copyGraph = graph
    
    for column in 0..<graph[0].count {
        var coordinate: [(Int, Int)] = []
        
        for row in (0..<graph.count).reversed() {
            if copyGraph[row][column] == "@" {
                coordinate.append((row, column))
            } else if !coordinate.isEmpty {
                let emptyCoordinate = coordinate.removeFirst()
                copyGraph[emptyCoordinate.0][emptyCoordinate.1] = copyGraph[row][column]
                copyGraph[row][column] = "@"
                coordinate.append((row, column))
            }
        }
    }
    
    return copyGraph
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let check1: [(row: Int, column: Int)] = [(-1, 0), (-1, -1), (0, -1)]
    let check2: [(row: Int, column: Int)] = [(1, 0), (1, 1), (0, 1)]
    let check3: [(row: Int, column: Int)] = [(-1, 0), (-1, 1), (0, 1)]
    let check4: [(row: Int, column: Int)] = [(1, 0), (+1, -1), (0, -1)]
    var graph: [[String]] = []
    
    var fourBlockCoordinate: [(Int, Int)] = [(0, 0)]
    
    for element in board {
        let blocks = element.map { String($0) }
        graph.append(blocks)
    }
    
    while !fourBlockCoordinate.isEmpty {
        fourBlockCoordinate = []
        
        for row in 0..<m {
            for column in 0..<n {
                if graph[row][column] != "@" {
                    fourBlockCoordinate += checkFourBlock(graph: graph, current: (row, column), direction: check1)
                    fourBlockCoordinate += checkFourBlock(graph: graph, current: (row, column), direction: check2)
                    fourBlockCoordinate += checkFourBlock(graph: graph, current: (row, column), direction: check3)
                    fourBlockCoordinate += checkFourBlock(graph: graph, current: (row, column), direction: check4)
                }
            }
        }
        
        for coordinate in fourBlockCoordinate {
            graph[coordinate.0][coordinate.1] = "@"
        }
        
        graph = dropBlock(graph: graph)
    }
    
    return graph.flatMap { $0 }.filter { $0 == "@" }.count
}
