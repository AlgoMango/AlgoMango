//https://www.acmicpc.net/problem/11729

func solution() {
    let count = Int(readLine()!)!
    
    func hanoi(count: Int, from a: Int, to c: Int, b: Int) {
        guard count != 1 else { return print("\(a) \(c)") }
        
        hanoi(count: count - 1, from: a, to: b, b: c) // n-1개를 보조 기둥으로 이동
        print("\(a) \(c)") //가장 큰 원반을 목표로 이동
        hanoi(count: count - 1, from: b, to: c, b: a) // n-1개를 목표로 이동
    }
    
    print(pow(2, count) - 1) // 전체 횟수: 2^n - 1
    hanoi(count: count, from: 1, to: 3, b: 2) // 1 -> 3 (보조: 2)
}

solution()
