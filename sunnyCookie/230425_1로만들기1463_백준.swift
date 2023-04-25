// https://www.acmicpc.net/problem/1463
// dp

let originNumber: Int = Int(readLine()!)!

func makeOne(n: Int) -> Int {
    var count: [Int] = [0, 0, 1, 1]

    guard n >= 4 else { return count[n] }

    for i in 4...n {
        var minCount = count[i-1]

        if i % 3 == 0 {
            minCount = min(minCount, count[i/3])
        }

        if i % 2 == 0 {
            minCount = min(minCount, count[i/2])
        }

        count.append(minCount+1)
    }

    return count[n]
}

print(makeOne(n: originNumber))
