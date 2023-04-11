// https://www.acmicpc.net/problem/15649
// 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
// 백트랙킹으로 푼거같진않다..

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
let numbers: [Int] = Array(1...n)

func recursion(answer: [Int]) {
    if answer.count == m {
        print(answer.map { String($0) }.joined(separator: " ") )
        return
    }

    for number in numbers {
        if !answer.contains(number) {
            let newAnswer: [Int] = answer + [number]
            recursion(answer: newAnswer)
        }
    }
}

numbers.forEach { recursion(answer: [$0]) }
