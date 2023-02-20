func solution() {
    let count = Int(readLine()!)!
    var queue: [Int] = []
    
    for _ in 1...count {
        let input = readLine()!
        
        switch input {
        case "front":
            print(queue.isEmpty ? -1 : queue.first!)
        case "back":
            print(queue.isEmpty ? -1 : queue.last!)
        case "size":
            print(queue.count)
        case "empty":
            print(queue.isEmpty ? 1 : 0)
        case "pop":
            print(queue.isEmpty ? -1 : queue.removeFirst())
        default:
            queue.append(Int(input.components(separatedBy: " ")[1])!)
        }
    }
}

solution()
