//
// BOJ: 큐
// 🔗 https://www.acmicpc.net/problem/10845


struct Queue {
    
    private var storage: [Int] = []
    
    mutating func push(x: Int) {
        storage.append(x)
    }
    
    mutating func pop() {
        if !storage.isEmpty {
            print(storage.removeFirst())
        } else {
            print(-1)
        }
    }
    
    func size() {
        print(storage.count)
    }
    
    func empty() {
        let result = storage.isEmpty ? 1 : 0
        print(result)
    }
    
    func front() {
        print(storage.first ?? -1)
    }
    
    func back() {
        print(storage.last ?? -1)
    }
    
    mutating func read(input: String) {
        let res = input.split(separator: " ")
        switch res[0] {
        case "push":
            push(x: Int(String(res[1]))!)
        case "pop":
            pop()
        case "size":
            size()
        case "empty":
            empty()
        case "front":
            front()
        case "back":
            back()
        default:
            return
        }
    }
}

let N = Int(readLine()!)!
var queue = Queue()
for _ in 1...N  {
    queue.read(input: readLine()!)
}
