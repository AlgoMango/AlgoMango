import Foundation

let location = readLine()!.split(separator: " ").map { Int($0)! }

let subin = location[0]
let brother = location[1]

if subin == brother {
    print(0)
    exit(0)
}

var dx = [1, -1, 2]

var needVisitQueue: [(Int, Int)] = [(subin, 0)]
var visits: [Int] = Array(repeating: 0, count: 100001)
var index = 0
var result = 0
var isEnd = false

while index < needVisitQueue.count && !isEnd {
    let currentNode = needVisitQueue[index]
    index += 1
    
    for x in dx {
        let xPosition: Int
        
        if x == 2 {
            xPosition = currentNode.0 * 2
        } else {
            xPosition = currentNode.0 + x
        }
        
        if xPosition < 0 || xPosition >= 100001 {
            continue
        }
        
        if visits[xPosition] != 0 {
            continue
        }
        
        if xPosition == brother {
            result = currentNode.1 + 1
            isEnd.toggle()
            break
        }
        
        needVisitQueue.append((xPosition, currentNode.1 + 1))
        visits[xPosition] = 1
    }
}

print(result)
