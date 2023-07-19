//12:00 ~ 12: 45
//풀이 둘다 시간초과데스,,

//#풀이1
func solution() {
    let count = Int(readLine()!)!
    var sortedNumbers: [Int] = []
    
    for _ in 1...count {
        let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        sortedNumbers += input
        
        if sortedNumbers.count > count {
            sortedNumbers.sort { $0 > $1 }
            sortedNumbers.removeLast(count)
        }
    }
    
    print(sortedNumbers.last!)
}

//#풀이2
func solution() {
    let count = Int(readLine()!)!
    var numbers: [[Int]] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: count), count: count)
    var current = 0
    var startIndex: [Int] = Array(repeating: count-1, count: count)
    var stack: [(number: Int, index: Int)] = []
    
    for _ in 1...count {
        let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        numbers.append(input)
    }

    for i in 0..<count {
        if numbers[startIndex[i]][i] >= 0 {
            stack.append((numbers[startIndex[i]][i], i))
        }
    }
    
    while current < count {
        stack = stack.sorted { $0.number < $1.number }
        let largest = stack.removeLast()
        let index = largest.index
        
        startIndex[index] -= 1
        current += 1
        
        if startIndex[largest.index] >= 0 {
            stack.append((numbers[startIndex[index]][index], index))
        }
        
        if current == count { print(largest.number) }
    }
}

solution()
