import Foundation

class Solution {
    var dx = [1, 0, -1, 0]
    var dy = [0, 1, 0, -1]
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter: Int = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    for (x, y) in zip(dx, dy) {
                        let xPosition = i + x
                        let yPosition = j + y
                        
                        if xPosition < 0 || xPosition >= grid.count || yPosition < 0 || yPosition >= grid[0].count {
                            perimeter += 1
                            continue
                        }
                        
                        if grid[xPosition][yPosition] == 0 {
                            perimeter += 1
                            continue
                        }
                    }
                }
            }
        }
        
        return perimeter
    }
}
