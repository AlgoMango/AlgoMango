func solution() {
    let input = readLine()!.components(separatedBy: " ")
    var numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let number = Int(input.first!)!
    var queue = Array(1...number)
    var result = 0

    while !numbers.isEmpty {
        let number = numbers[0]
        let targetIndex = queue.firstIndex(of: number)!
        
        if number == queue[0] {
            queue.removeFirst()
            numbers.removeFirst()
        } else if targetIndex > queue.count / 2 {
            queue.insert(queue.removeLast(), at: 0)
            result += 1
        } else {
            queue.append(queue.removeFirst())
            result += 1
        }
    }
    
    print(result)
}

solution()
