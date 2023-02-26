//230226_10866덱_백준

// 나도 덱을 만들어보자..

class Deque {
    var leftDeque: [Int] = []
    var rightDeque: [Int] = []
    
    var isEmpty: Int {
        if leftDeque.isEmpty && rightDeque.isEmpty {
            return 1
        }
        return 0
    }
    
    var size: Int {
        return leftDeque.count + rightDeque.count
    }
    
    var front: Int {
        if self.isEmpty == 1 { return -1 }
        
        if !leftDeque.isEmpty {
            return leftDeque.last!
        } else {
            return rightDeque.first!
        }
    }
    
    var back: Int {
        if self.isEmpty == 1 { return -1 }
        
        if !rightDeque.isEmpty {
            return rightDeque.last!
        } else {
            return leftDeque.first!
        }
    }
    
    func pushFront(num: Int) {
        leftDeque.append(num)
    }
    
    func pushBack(num: Int) {
        rightDeque.append(num)
    }
    
    func popFront() -> Int {
        if self.isEmpty == 1 { return -1 }
        
        if !leftDeque.isEmpty {
            return leftDeque.removeLast()
        } else {
            leftDeque = rightDeque.reversed()
            rightDeque.removeAll()
            return leftDeque.removeLast()
        }
    }
    
    func popBack() -> Int {
        if self.isEmpty == 1 { return -1 }
        
        if !rightDeque.isEmpty {
            return rightDeque.removeLast()
        } else {
            rightDeque = leftDeque.reversed()
            leftDeque.removeAll()
            return rightDeque.removeLast()
        }
    }
    
}

let testCase = Int(readLine()!)!

var deque = Deque()

for _ in 0..<testCase {
    let input = readLine()!
    
    switch input {
    case "front":
        print(deque.front)
    case "back":
        print(deque.back)
    case "empty":
        print(deque.isEmpty)
    case "size":
        print(deque.size)
    default:
        let inputs = input.split(separator: " ").map { String($0) }
        switch inputs[0] {
        case "push_front":
            deque.pushFront(num: Int(inputs[1])!)
        case "push_back":
            deque.pushBack(num: Int(inputs[1])!)
        case "pop_front":
            print(deque.popFront())
        case "pop_back":
            print(deque.popBack())
        default:
            continue
        }
    }
}



//var deque: [String] = []
//
//for _ in 0..<testCase {
//    let input = readLine()!
//
//    switch input {
//    case "front":
//        print(deque.isEmpty ? -1 : deque.first!)
//    case "back":
//        print(deque.isEmpty ? -1 : deque.last!)
//    case "empty":
//        print(deque.isEmpty ? 1 : 0)
//    case "size":
//        print(deque.count)
//    default:
//        let inputs = input.split(separator: " ").map { String($0) }
//        switch inputs[0] {
//        case "push_front":
//            deque.insert(inputs[1], at: 0)
//        case "push_back":
//            deque.append(inputs[1])
//        case "pop_front":
//            if deque.isEmpty {
//                print(-1)
//                continue
//            }
//            print(deque.removeFirst())
//        case "pop_back":
//            if deque.isEmpty {
//                print(-1)
//                continue
//            }
//            print(deque.removeLast())
//        default:
//            continue
//        }
//    }
//}
