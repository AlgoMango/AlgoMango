import Foundation

let commandCount = Int(readLine()!)!
var queue: [Int] = []
var results: [Int] = []

for _ in 1...commandCount {
    let command = readLine()!
    
    switch command {
    case "pop":
        if !queue.isEmpty {
            results.append(queue.removeFirst())
        } else {
            results.append(-1)
        }
    case "size":
        results.append(queue.count)
    case "empty":
        let num = queue.isEmpty ? 1 : 0
        results.append(num)
    case "front":
        guard let first = queue.first else {
            results.append(-1)
            break
        }
        
        results.append(first)
    case "back":
        guard let last = queue.last else {
            results.append(-1)
            break
        }
        
        results.append(last)
    default:
        queue.append(Int(command.components(separatedBy: " ")[1])!)
    }
}

results.forEach {
    print($0)
}
