func solution() {
    let count = Int(readLine()!)!
    var enqueue: [Int] = [] //추가하는 큐
    var dequeue: [Int] = [] //제거하는 
    
    for _ in 1...count {
        let input = readLine()!
        
        if input == "front" {
            if enqueue.isEmpty, dequeue.isEmpty {
                print(-1)
            } else if dequeue.isEmpty {
                print(enqueue.first!)
            } else {
                print(dequeue.last!)
            }
        } else if input == "back" {
            if enqueue.isEmpty, dequeue.isEmpty {
                print(-1)
            } else if enqueue.isEmpty {
                print(dequeue.first!)
            } else {
                print(enqueue.last!)
            }
        } else if input == "size" {
            print(enqueue.count + dequeue.count)
        } else if input == "empty" {
            print(enqueue.isEmpty && dequeue.isEmpty ? 1 : 0)
        } else if input.contains("push_front") {
            let number = Int(input.components(separatedBy: " ").last!)!
            
            dequeue.append(number)
        } else if input.contains("push_back") {
            let number = Int(input.components(separatedBy: " ").last!)!
            
            enqueue.append(number)
        } else if input.contains("pop_front") {
            if enqueue.isEmpty, dequeue.isEmpty {
                print(-1)
            } else if dequeue.isEmpty {
                dequeue = enqueue.reversed()
                print(dequeue.removeLast())
                enqueue = []
            } else {
                print(dequeue.removeLast())
            }
        } else if input.contains("pop_back") {
            if enqueue.isEmpty, dequeue.isEmpty {
                print(-1)
            } else if enqueue.isEmpty {
                print(dequeue.removeFirst())
            } else {
                print(enqueue.removeLast())
            }
        }
    }
}

solution()
