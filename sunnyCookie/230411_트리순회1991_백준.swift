// https://www.acmicpc.net/problem/1991

import Foundation

let inputN: Int = Int(readLine()!)!
var NodeDictionary: [Character: [Character]] = [:]
var first: Character! = nil

var 전위순회Answer: [Character] = []
var 중위순회Answer: [Character] = []
var 후위순회Answer: [Character] = []

for n in 0..<inputN {
    let input: [Character] = readLine()!.split(separator: " ").map { Character(String($0)) }
    NodeDictionary[input[0]] = [input[1], input[2]]

    if n == 0 {
        first = input[0]
    }
}

func 순회(node: Character) {
    guard let left = NodeDictionary[node]?[0], 
          let right = NodeDictionary[node]?[1] else {
        return
    }

    if left == "." && right == "." {
        전위순회Answer.append(node)
        중위순회Answer.append(node)
        후위순회Answer.append(node)
        return
    }

    전위순회Answer.append(node)   // ✨ 순회 재귀 타기전 출력 -> 전위순회
    순회(node: left)
    중위순회Answer.append(node)  // ✨ 순회 left는 타고 right 타기 전 출력 -> 중위순회
    순회(node: right)
    후위순회Answer.append(node)  // ✨ 순회 다 타고 출력 -> 후위순회
}

순회(node: first)

print(String(전위순회Answer))
print(String(중위순회Answer))
print(String(후위순회Answer))
