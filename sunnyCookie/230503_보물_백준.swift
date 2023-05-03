// https://www.acmicpc.net/problem/1026

let n: Int = Int(readLine()!)!
var a: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var b: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

a.sort()
var answer: Int = 0

for i in 0..<n {
    var maxIdx = b.firstIndex(of: b.max()!)!
    answer += a[i] * b[maxIdx]
    b[maxIdx] = 0
}

print(answer)
