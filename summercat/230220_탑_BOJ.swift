// BOJ 2493 탑
// https://www.acmicpc.net/problem/2493

let n = Int(readLine()!)!
var towers = readLine()!.split(separator: " ").compactMap{ Int($0) }
var answer: [Int] = Array(repeating: 0, count: n)
var stack: [Int] = []
var idxStack: [Int] = []

// 새로 들어올 노드의 인덱스
var cur: Int = n - 1
// true이면 새 노드를 받고, false이면 스택의 노드를 검사해서 뺀다
var dir: Bool = true

while !towers.isEmpty {
    let num = towers.removeLast()
    checkDirection(num)
    
    if dir {
        stack.append(num)
        idxStack.append(cur)
        cur -= 1
    } else {
        while !dir {
            stack.removeLast()
            let idx = idxStack.removeLast()
            answer[idx] = cur + 1
            checkDirection(num)
        }
        stack.append(num)
        idxStack.append(cur)
        cur -= 1
    }
}

func checkDirection(_ newNumber: Int) {
    if stack.isEmpty || stack.last! > newNumber { dir = true }
    else if !stack.isEmpty && stack.last! < newNumber { dir = false }
}

answer.forEach { print($0, terminator: " ") }
