import Foundation

final class Queue {
    private var queue: [Int]
    private var index = 0
    var sum: Int
    var count: Int {
        return queue.count
    }
    
    init(queue: [Int], sum: Int) {
        self.queue = queue
        self.sum = sum
    }
    
    func pop() -> Int {
        let element = queue[index]
        index += 1
        sum -= element
        
        return element
    }
    
    func push(element: Int) {
        queue.append(element)
        sum += element
    }
}


func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let queue1Sum = queue1.reduce(0, +)
    let queue2Sum = queue2.reduce(0, +)
    let target = (queue1Sum + queue2Sum) / 2
    var workCount = 0
    
    if queue1Sum == target && queue2Sum == target {
        return 0
    } else if (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    }
    
    let firstQueue = Queue(queue: queue1, sum: queue1Sum)
    let secondQueue = Queue(queue: queue2, sum: queue2Sum)
    
    while firstQueue.count < queue1.count * 2 {
        if firstQueue.sum == secondQueue.sum {
            return workCount
        }
        
        if firstQueue.sum > secondQueue.sum {
            let element = firstQueue.pop()
            secondQueue.push(element: element)
            workCount += 1
        } else {
            let element = secondQueue.pop()
            firstQueue.push(element: element)
            workCount += 1
        }
    }
    
    return -1
}
