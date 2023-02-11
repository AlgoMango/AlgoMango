//230211_10808알파벳개수_백준

import Foundation

let input = readLine()!.map { String($0) }

// 아스키 코드 사용방법
// 알파벳에 대한 Dictionary 생성 후 추가하는 방법

var result:[Int] = []

for _ in 0..<26 {
    result.append(0)
}

for alpha in input {
    result[Int(Character(alpha).asciiValue!) - 97] += 1
}

for num in result {
    print(num, terminator: " ")
}
