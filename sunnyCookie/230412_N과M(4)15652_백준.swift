/*
https://www.acmicpc.net/problem/15652

1부터 N까지 자연수 중에서 M개를 고른 수열
- 같은 수를 여러 번 골라도 된다.
- 고른 수열은 오름차순(같은숫자허용)이어야 한다
*/

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
let numbers: [Int] = Array(1...n)

func recursion(answer: [Int]) {
    if answer.count == m {
        print(answer.map { String($0) }.joined(separator: " ") )
        return
    }

    numbers.forEach {
        if answer.last! <= $0 {
            recursion(answer: answer + [$0])
        }
    }
}

numbers.forEach { recursion(answer: [$0]) }
