/*
// https://www.acmicpc.net/problem/15651
1부터 N까지 자연수 중에서 M개를 고른 수열
- 같은 수를 여러 번 골라도 된다.

시간초과이슈: Int로 저장한 후 출력하면 시간초과나서 String으로 저장 후 출력
*/
import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
let numbers: [String] = Array(1...n).map { String($0) }

func recursion(answer: String) {
    if answer.count == m * 2 - 1 { // 띄어쓰기도 같이 세줘야해서 (m*2-1) 
        print(answer)
        return
    }

    numbers.forEach {
        recursion(answer: answer + " " + $0)
    }
}

numbers.forEach { recursion(answer: $0) }

/*
시간초과나는 해결법: Int로 저장하고 출력

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
let numbers: [Int] = Array(1...n)

func recursion(answer: [Int]) {
    if answer.count == m {
        print(answer.map { String($0) }.joined(separator: " ") )
        return
    }

    numbers.forEach {
        recursion(answer: answer + [$0])
    }
}

numbers.forEach { recursion(answer: [$0]) }
*/
