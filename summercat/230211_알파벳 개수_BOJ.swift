// BOJ 10808 알파벳 개수
// https://www.acmicpc.net/problem/10808

import Foundation

var answers = Array(repeating: 0, count: 26)
let input: [Character] = Array(readLine()!)
let a: Character = "a"

for char in input {
    let index: Int = Int(char.asciiValue! - a.asciiValue!)
    answers[index] += 1
}

answers.forEach { print($0, terminator: " ")}
