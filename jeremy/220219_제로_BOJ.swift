//
// BOJ: 제로
// 🔗 https://www.acmicpc.net/problem/10773

let K = Int(readLine()!)!
var stack: [Int] = []
for _ in 0...K - 1{
    let input = Int(readLine()!)!
    if input == 0 {
        _ = stack.popLast()
        continue
    }
    stack.append(input)
}
let result = stack.reduce(0, { $0 + $1})
print(result)
