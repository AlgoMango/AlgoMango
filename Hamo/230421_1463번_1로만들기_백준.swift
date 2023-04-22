import Foundation

let x = Int(readLine()!)!

var visits = Array(repeating: 0, count: 1000001)
visits[x] = 1

func bfs() {
    var needVisitQueue: [Int] = [x]
    var index: Int = 0
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        if currentNode % 3 == 0 && visits[currentNode / 3] == 0 {
            needVisitQueue.append(currentNode / 3)
            visits[currentNode / 3] += visits[currentNode] + 1
        }
        
        if currentNode % 2 == 0 && visits[currentNode / 2] == 0 {
            needVisitQueue.append(currentNode / 2)
            visits[currentNode / 2] += visits[currentNode] + 1
        }
        
        if visits[currentNode - 1] == 0 {
            needVisitQueue.append(currentNode - 1)
            visits[currentNode - 1] = visits[currentNode] + 1
        }
        
        if visits[1] > 0 {
            break
        }
    }
}

bfs()
print(visits[1] - 1)
