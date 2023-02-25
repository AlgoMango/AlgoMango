import Foundation

final class Queue {
    private var left: [Int]
    private var right: [Int] = []
    private var result: Int = 0
    var count: Int {
        return left.count + right.count
    }
    
    var first: Int {
        if left.isEmpty {
            return right.first!
        } else {
            return left.last!
        }
    }
    
    init(left: [Int]) {
        self.left = left.reversed()
    }
    
    func indexOf(_ target: Int) -> Int {
        let queue = left.reversed() + right
        return queue.firstIndex(of: target)!
    }
    
    func popFirst() -> Int {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        
        return left.removeLast()
    }
    
    func moveToRight() {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        
        left.append(right.removeLast())
        result += 1
    }
    
    func moveToLeft() {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        
        right.append(left.removeLast())
        result += 1
    }
    
    func printResult() {
        print(result)
    }
}

enum MoveDirection {
    case left
    case right
}

let count = Int(readLine()!.components(separatedBy: " ")[0])!
var targets = readLine()!.components(separatedBy: " ").map { Int($0)! }
var queue: Queue = Queue(left: Array(1...count))

var result = 0

for target in targets {
    var popElement: Int?
    var targetIndex = queue.indexOf(target)
    
    var moveDirection: MoveDirection = (queue.count / 2) >= targetIndex ? .left : .right
    
    while popElement != target {
        if queue.first == target {
            popElement = queue.popFirst()
        } else {
            switch moveDirection {
            case .left:
                queue.moveToLeft()
            case .right:
                queue.moveToRight()
            }
        }
    }
}

queue.printResult()
