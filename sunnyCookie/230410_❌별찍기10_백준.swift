import Foundation


//https://www.acmicpc.net/problem/2447
// 풀이답: *을 그려 나가는 방법
// 다른방법: *이 전부그려진 맵에서 9사분면으로 나누어서 *을 " " 로 바꾸는 방법 -> 썸캣답지보기

let input = Int(readLine()!)!

func prtStar(n: Int, pattern: [String]) {
    if n == 1 {
        pattern.forEach { print($0) }
        return
    }

    let row1: [String] = pattern.map { $0 + $0 + $0 }
    let row2: [String] = pattern.map { $0 + String(repeating: " ", count: $0.count) + $0 }
    let newPattern: [String] = row1 + row2 + row1

    prtStar(n: n/3, pattern: newPattern)
}

prtStar(n: input, pattern: ["*"])
