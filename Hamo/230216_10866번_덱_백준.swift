import Foundation

final class Deque {
    var left: [Int]
    var right: [Int] = []
    
    var size: Int {
        return left.count + right.count
    }
    
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    var front: Int {
        if self.isEmpty {
            return -1
        } else if left.isEmpty {
            return right.first!
        } else {
            return left.last!
        }
    }
    
    var back: Int {
        if self.isEmpty {
            return -1
        } else if right.isEmpty {
            return left.first!
        } else {
            return right.last!
        }
    }
    
    init(left: [Int]) {
        self.left = left
    }
    
    func pushFront(element: Int) {
        left.append(element)
    }
    
    func pushBack(element: Int) {
        right.append(element)
    }
    
    func popFront() -> Int {
        guard !self.isEmpty else {
            return -1
        }
        
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        
        return left.popLast()!
    }
    
    func popBack() -> Int {
        guard !self.isEmpty else {
            return -1
        }
        
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        
        return right.popLast()!
    }
}

let commandCount = Int(readLine()!)!

let deque: Deque = Deque(left: [])
var results: [Int] = []

for _ in 1...commandCount {
    let command = readLine()!
    
    switch command {
    case "front":
        results.append(deque.front)
    case "back":
        results.append(deque.back)
    case "size":
        results.append(deque.size)
    case "empty":
        let num = deque.isEmpty ? 1 : 0
        results.append(num)
    case "pop_front":
        results.append(deque.popFront())
    case "pop_back":
        results.append(deque.popBack())
    default:
        let temp = command.components(separatedBy: "_")[1].components(separatedBy: " ")
        if temp[0] == "back" {
            deque.pushBack(element: Int(temp[1])!)
        } else {
            deque.pushFront(element: Int(temp[1])!)
        }
    }
}


results.forEach {
    print($0)
}
