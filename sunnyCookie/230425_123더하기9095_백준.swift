// https://www.acmicpc.net/problem/9095

let n: Int = Int(readLine()!)!

for _ in 0..<n {
    print(count(n: Int(readLine()!)!))
}

func count(n: Int) -> Int {
    var counts: [Int] = [0, 1, 2, 4]

    guard n >= 4 else { return counts[n] }

    for i in 4...n {
        counts.append(counts[i-3] + counts[i-2] + counts[i-1])
    }

    return counts[n]
}
