//https://www.acmicpc.net/problem/17298

func solution() {
    let count = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    var stack = [0]
    var result = Array(repeating: -1, count: count)
    
    for i in 1..<numbers.count {
        while !stack.isEmpty, numbers[i] > numbers[stack.last!] {
            result[stack.removeLast()] = numbers[i]
        }
        
        stack.append(i)
    }
    
    print(result.map { String($0) }.joined(separator: " "))
}

solution()
