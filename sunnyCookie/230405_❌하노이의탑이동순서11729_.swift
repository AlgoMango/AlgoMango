// https://www.acmicpc.net/problem/11729
// 재귀


let n = Int(readLine()!)!

func count(n: Int) -> Int {
    if n == 1 {
        return 1
    }

    let count = count(n: n-1)
    return count*2 + 1
}

func move(n: Int, from: Int, by: Int, to: Int) {
    if n == 1 {
        print("\(from) \(to)")
    } else {
        move(n: n-1, from: from, by: to, to: by)
        print("\(from) \(to)")
        move(n: n-1, from: by, by: from, to: to)
    }
}

print(count(n: n))
move(n: n, from: 1, by: 2, to: 3)
