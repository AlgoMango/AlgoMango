import Foundation

func solution() {
    let count = Int(readLine()!)!
    var highest: Int = 1
    var stack: [Int] = []
    var result: [String] = []

    for _ in 1...count {
        let number = Int(readLine()!)!
        
        while highest <= number {
            stack.append(highest)
            result.append("+")
            highest += 1
        }
        
        if stack.last == number {
            stack.removeLast()
            result.append("-")
        } else {
            print("NO")
            return
        }
    }
    
    result.forEach { print($0) }
}

solution()
