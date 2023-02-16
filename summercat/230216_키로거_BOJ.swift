// BOJ 5397 키로거
// https://www.acmicpc.net/problem/5397

// 시간초과
let cases = Int(readLine()!)!

func solve() {
    let input = Array(readLine()!)
    var answer: [Character] = []
    var curIdx: Int = 0
    for char in input {
        if char == "<" {
            if curIdx != 0 { curIdx -= 1 }
        } else if char == ">" {
            if curIdx < answer.count - 1 { curIdx += 1 }
        } else if char == "-" {
            if curIdx == 0 { continue }
            else {
                answer.remove(at: curIdx - 1)
                curIdx -= 1
            }
        } else {
            // curIdx = 0
            answer.insert(char, at: curIdx)
            curIdx += 1
            // curIdx = 1
            // [a]
        }
    }
    
    answer.forEach { print($0, terminator: "")}
}

for _ in 1...cases {
    solve()
    print()
}

// 시간초과 X
let cases = Int(readLine()!)!

func solve() {
    let input = Array(readLine()!)
    var answer: [Character] = []
    var shifted: [Character] = []
    
    for char in input {
        if char == "<" {
            if answer.isEmpty { continue }
            shifted.append(answer.removeLast())
        } else if char == ">" {
            if shifted.isEmpty { continue }
            answer.append(shifted.removeLast())
        } else if char == "-" {
            if answer.isEmpty { continue }
            answer.removeLast()
        } else {
            answer.append(char)
        }
    }
    
    var str = String(answer)
    str += String(shifted.reversed())
    print(str)
}

for _ in 1...cases {
    solve()
}
