let n = Int(readLine()!)!
var queue = Array(1...n)
var idx: Int = 0

// idx = 0, queue.count = 5
// v
// 1 2 3 4
// 1 2 3 4 2

// idx = 2, queue.count = 6
//     v
// 1 2 3 4 2
// 1 2 3 4 2 4

// idx = 4, queue.count = 7
//         v
// 1 2 3 4 2 4
// 1 2 3 4 2 4 4


// idx = 6, queue.count

while idx < queue.count - 1 {
//    print(idx, queue)
    queue.append(queue[idx + 1])
    idx += 2
}

print(queue.last!)
