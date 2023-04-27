// https://www.acmicpc.net/problem/14501

let n: Int = Int(readLine()!)!
var tp: [(t: Int, p:Int)] = [(t: 0, p:0)]
var totals: [Int] = Array(repeating: 0, count: n+2)

for _ in 0..<n {
    let newTP = readLine()!.split(separator: " ").map { Int(String($0))! }
    tp.append((t: newTP[0], p: newTP[1]))
}

for i in 1...n {
    for j in i..<i+tp[i].t { // ✅ 1번째 일이 3일이 걸리면 4일로 뛰어야되는데 2,3일때가 점수가 더 높을 수 있으니 1..<4 확인
        guard j <= n else { continue }
        let t = tp[j].t
        let p = tp[j].p

        if j+t <= n+1 {
            totals[j+t] = max(totals[j+t], p+totals[i]) // ✅ 1번째일이 최선인지 확인하기위해 2일째(T:2일걸림)를 확인중이라면
                        // 4일째에 점수는 (1일째(3일걸림)에서 쌓았던 점수 vs 1일을 건너뛰고 2일째(2일걸림) 에 쌓은 점수 중 큰거)
        }
    }
}

print(totals.max()!)
