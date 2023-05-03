// https://www.acmicpc.net/problem/2217

let n: Int = Int(readLine()!)!
var ropes: [Int] = []

for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}

ropes.sort()

var answer: Int = ropes.last!

for i in 0..<ropes.count {
    let count = ropes.count - (i)
    let maxW = ropes[i]*count
    answer = max(answer, maxW)
}

print(answer)
