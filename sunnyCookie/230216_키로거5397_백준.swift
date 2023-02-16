//https://www.acmicpc.net/problem/5397 
// 메모리: 120280 KB , 시간: 560ms

import Foundation

let caseNumber: Int = Int(readLine()!)! 
// ⭐️⭐️⭐️ Int타입명시 안해주는게 더 빠르다?? -> 536ms (메모리는 똑같아)

func checkPassword(input: [Character]) -> String { 
    var left: [Character] = []
    var right: [Character] = []

    for char in input {
        switch char {
        case "<":
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        case ">":
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        case "-":
            if !left.isEmpty {
                left.removeLast()
            }
        default:
            left.append(char)
        }
    }


    return String(left + right.reversed())
}

for _ in 0..<caseNumber {
    let left: [Character] = Array(readLine()!)  // ⭐️⭐️⭐️ Int타입명시 안해주는게 더 빠르네??? -> 536ms (메모리는 똑같아), 
                                                // ⭐️⭐️⭐️ String 배열로 받는것보다 Character배열로받는게 빠르고 메모리가적음 -> [String] 이면 131096 Kb, 628 ms
    print(checkPassword(input: left))
}
