//
//  BOJ: 스택
// 
    

struct Stack {
    enum InputType {
        case push(x: Int)
        case pop
        case size
        case empty
        case top
    }
    private var storage: [Int] = []
    
    private mutating func push(x: Int) {
        storage.append(x)
    }
    
    private mutating func pop() {
        if storage.isEmpty {
            print(-1)
            return
        }
        print(storage.popLast()!)
    }
    
    private func size() {
        print(storage.count)
    }
    
    private func empty() {
        if storage.isEmpty {
            print(1)
            return
        }
        print(0)
    }
    
    private func top()  {
        if storage.isEmpty {
            print(-1)
            return
        }
        print(storage.last!)
    }
    
    mutating func read(input: String) {
        let input = input.split(separator: " ")
        switch input.first {
        case "push":
            push(x: Int(input[1])!)
        case "pop":
            pop()
        case "size":
            size()
        case "empty":
            empty()
        case "top":
            top()
        default:
            return
        }
    }
}

let N = Int(readLine()!)!
var stack = Stack()
for _ in 0...N - 1 {
    stack.read(input: readLine()!)
}
