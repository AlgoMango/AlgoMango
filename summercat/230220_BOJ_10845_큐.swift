var queue: [Int] = []

func push(_ num: Int) {
    queue.append(num)
}

func pop() {
    if queue.isEmpty { print(-1) }
    else { print(queue.removeFirst()) }
}

func size() {
    print(queue.count)
}

func empty() {
    if queue.isEmpty { print(1) }
    else { print(0) }
}

func front() {
    if queue.isEmpty { print(-1) }
    else { print(queue[0]) }
}

func back() {
    if queue.isEmpty { print(-1) }
    else { print(queue.last!) }
}

let commands: Int = Int(readLine()!)!

for _ in 1...commands {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let command = input[0]
    
    if input.count == 2 {
        push(Int(input[1])!)
    } else if command == "pop" {
        pop()
    } else if command == "size" {
        size()
    } else if command == "empty" {
        empty()
    } else if command == "front" {
        front()
    } else if command == "back" {
        back()
    }
}
