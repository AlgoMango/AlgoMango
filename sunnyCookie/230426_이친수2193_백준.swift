// https://www.acmicpc.net/problem/2193

let n: Int = Int(readLine()!)!

var count: [Int] = [0, 1, 1]

if n > 2 {
    for i in 3...n {
        count.append(count[i-1] + count[i-2])
    }
}

print(count[n])
