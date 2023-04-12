//https://www.acmicpc.net/problem/1182

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0], target = input[1]
    var stack = [Int]()
    var result = 0
    
    func dfs(count: Int, index: Int) {
        if stack.count == count {
            if stack.reduce(0, +) == target {
                result += 1
                return
            }
            return
        }
        
        (index..<n).forEach {
            stack.append(numbers[$0])
            dfs(count: count, index: $0+1)
            stack.removeLast()
        }
    }
    
    (1...n).forEach {
        dfs(count: $0, index: 0)
    }
            
    print(result)
}

solution()
