// BOJ 10828 스택
// https://www.acmicpc.net/problem/10828

let commandCount = Int(readLine()!)!
var stack: [Int] = []

func push(_ num: Int) {
    stack.append(num)
}

func pop() {
    if stack.isEmpty { print(-1) }
    else { print(stack.removeLast()) }
}

func top() {
    if stack.isEmpty { print(-1) }
    else { print(stack.last!)}
}

func size() {
    print(stack.count)
}

func empty() {
    if stack.isEmpty { print(1) }
    else { print(0) }
}

for _ in 1...commandCount {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input.count == 2 {
        let num = Int(input[1])!
        push(num)
    } else {
        let com = input[0]
        if com == "pop" { pop() }
        else if com == "size" { size() }
        else if com == "empty" { empty() }
        else if com == "top" { top() }
    }
}
