import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    let height = table.count
    let width = table[0].count
    var tableVisits: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    
    var blocks: [[Int]] = []
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    for i in 0..<height {
        for j in 0..<width {
            if table[i][j] == 1 {
                tableVisits[i][j] = 1
                tableBfs(start: (i, j))
            }
        }
    }
    
    print(blocks)
    
    func tableBfs(start: (Int, Int)) {
        var needVisitQueue: [(Int, Int)] = [start]
        var temp: [Int] = []
        var index = 0
        
        while index < needVisitQueue.count {
            let currentNode = needVisitQueue[index]
            index += 1
            
            var count = 0
            for (x, y) in zip(dx, dy) {
                let xPosition = currentNode.0 + x
                let yPosition = currentNode.1 + y

                guard (0..<height) ~= xPosition && (0..<width) ~= yPosition else {
                    continue
                }
                
                guard tableVisits[xPosition][yPosition] == 0 else {
                    continue
                }
                
                guard table[xPosition][yPosition] == 1 else {
                    continue
                }
                
                needVisitQueue.append((xPosition, yPosition))
                tableVisits[xPosition][yPosition] = 1
                count += 1
            }
            
            if count != 0 {
                temp.append(count)
            }
        }
        
        if !temp.isEmpty {
            blocks.append(temp)
        }
    }
    
    return -1
}
