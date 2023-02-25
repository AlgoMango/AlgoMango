// https://www.acmicpc.net/problem/3986

let count: Int = Int(readLine()!)!
var answer: Int = 0

for _ in 1...count {
    let alphabets: [Character] = Array(readLine()!)
    var stack: [Character] = []

    if alphabets.count % 2 == 1 {
        continue
    }

    for alphabet in alphabets {
        if stack.isEmpty {
            stack.append(alphabet)
        } else {
            if stack.last! == alphabet {
                stack.removeLast()
            } else {
                stack.append(alphabet)
            }
        }
    }

    answer += stack.isEmpty ? 1 : 0
}

print(answer)
