import Foundation

class Solution {
    var dx = [1, 0, -1, 0]
    var dy = [1, 0, 0, -1]
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var visits: [[Int]] = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        var perimeter: Int = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    var needVisitQueue: [(Int, Int)] = [(i, j)]
                    var index = 0
                    
                    while index < needVisitQueue.count {
                        let currentNode = needVisitQueue[index]
                        index += 1
                        
                        for (x, y) in zip(dx, dy) {
                            let xPosition = currentNode.0 + x
                            let yPosition = currentNode.1 + y
                            
                            if xPosition < 0 || xPosition >= grid.count || yPosition < 0 || yPosition >= grid[0].count {
                                perimeter += 1
                                continue
                            }
                            
                            if visits[xPosition][yPosition] == 1 {
                                continue
                            }
                            
                            if grid[xPosition][yPosition] == 0 {
                                perimeter += 1
                                continue
                            }
                            
                            if grid[xPosition][yPosition] == 1 {
                                needVisitQueue.append((xPosition, yPosition))
                                visits[xPosition][yPosition] = 1
                            }
                        }
                    }
                    
                    return perimeter
                }
            }
        }
        
        
        return perimeter
    }
}
