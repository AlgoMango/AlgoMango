// BOJ 2577 숫자의 개수
// https://www.acmicpc.net/problem/2577

import Foundation

var answers = Array(repeating: 0, count: 10)
var number: Int = 1

for _ in 1...3 {
    number *= Int(readLine()!)!
}

let numStr = String(number)

for num in numStr {
    answers[Int(String(num))!] += 1
}

answers.forEach { print($0) }
