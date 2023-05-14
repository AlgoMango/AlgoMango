import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var arr: [[Int]] = []
    var returnArray: [Int] = []
    
    for i in 0..<rows {
        arr.append(Array(i*columns + 1...columns * (i + 1)))
    }
   
    for q in queries {
        let miny = q[0] - 1
        let minx = q[1] - 1
        let maxy = q[2] - 1
        let maxx = q[3] - 1
        
        let num = arr[miny][minx]
        
        var minNumber = num
        
        for y in miny..<maxy {
            minNumber = min(arr[y + 1][minx], minNumber)
            arr[y][minx] = arr[y + 1][minx]
        }
        
        for x in minx..<maxx {
            minNumber = min(arr[maxy][x + 1], minNumber)
            arr[maxy][x] = arr[maxy][x + 1]
            
        }
        
        for y in (miny + 1...maxy).reversed() {
            minNumber = min(arr[y - 1][maxx], minNumber)
            arr[y][maxx] = arr[y - 1][maxx]
        }
        
        for x in (minx + 1...maxx).reversed() {
            minNumber = min(arr[miny][x - 1], minNumber)
            arr[miny][x] = arr[miny][x - 1]
        }
        arr[miny][minx + 1] = num
        
        returnArray.append(minNumber)
    }
    
    return returnArray
}
