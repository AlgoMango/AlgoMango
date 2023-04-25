// https://www.acmicpc.net/problem/1003

let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let answer = countZeroAndOne(Int(readLine()!)!)
    print(answer.zero, answer.one)
}

func countZeroAndOne(_ num: Int) -> (zero: Int, one: Int) {
    var values: [(zero: Int, one: Int)] = [(zero: 1, one: 0), // 0
                                           (zero: 0, one: 1)] // 1
    guard num > 1 else { return values[num] }

    for i in 2...num {
        values.append((zero: values[i-1].zero + values[i-2].zero,
                       one: values[i-1].one + values[i-2].one))
    }

    return values[num]
}
