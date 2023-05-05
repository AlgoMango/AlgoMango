// https://school.programmers.co.kr/learn/courses/30/lessons/42862?language=swift

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var counts: [Int] = Array(repeating: 1, count: n)
    let xMove: [Int] = [-1, 1]

    lost.forEach { counts[$0-1] -= 1 }
    reserve.forEach { counts[$0-1] += 1 }

    for num in 0..<counts.count {
        guard counts[num] == 0 else { continue }

        for idx in 0..<2 {
            let newNum = num + xMove[idx]

            guard (0..<n) ~= newNum && counts[newNum] > 1 else { continue }
            counts[newNum] -= 1
            counts[num] += 1
            break
        }
    }

    return counts.filter { $0 != 0 }.count
}
