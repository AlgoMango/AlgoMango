func solution() {
    let count = Int(readLine()!)!
    var result = 0
    var stack: [Character] = []
    
    for _ in 1...count {
        let letters = readLine()!
        stack = []
        
        for letter in letters {
            if let last = stack.last, last == letter {
                stack.removeLast()
            } else {
                stack.append(letter)
            }
        }
        
        if stack.isEmpty {
            result += 1
        }
    }
    
    print(result)
}

solution()
