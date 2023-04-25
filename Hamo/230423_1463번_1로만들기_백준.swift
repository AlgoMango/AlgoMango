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

// DP로 풀이

import Foundation

let count = Int(readLine()!)!

var arr: [Int] = Array(repeating: 0, count: 1000005)
arr[1] = 0

if count == 1 {
    print(0)
    exit(0)
}

for i in 2...count {
    arr[i] = arr[i - 1] + 1

    if i % 2 == 0 {
        arr[i] = min(arr[i], arr[i / 2] + 1)
    }

    if i % 3 == 0 {
        arr[i] = min(arr[i], arr[i / 3] + 1)
    }
}

print(arr[count])

