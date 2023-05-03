// https://www.acmicpc.net/problem/11399

let n: Int = Int(readLine()!)!
var times: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var answer: Int = 0

for i in 0..<n {
    answer += times[i] * (n-i)
}

print(answer)
