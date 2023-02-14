
// https://www.acmicpc.net/problem/10808

import Foundation

// 시간단축 16ms
let line = readLine()!.utf8
var result = Array(repeating: 0, count: 26)

line.forEach { number in
    let aNumber = Int(Character("a").asciiValue!)
    result[Int(number) - aNumber] += 1
}

print(result.map {String($0)}.joined(separator: " "))


// (처음통과 답안) 함수로 만들어서 풀기 - 24ms
let lines = readLine()!

func checkAlphabetCount(line: String) -> String {
    var counts = Array(repeating: 0, count: 26)
    let stringArray = Array(line).map { String($0) }

    stringArray.forEach { character in
        let index = Int(UnicodeScalar(character)!.value - UnicodeScalar("a").value)
        counts[index] += 1
    }

    return counts.map { String($0) }.joined(separator: " ")
}

print(checkAlphabetCount(line: lines))

// import Foundation 필수
// print문으로 답 제출.
