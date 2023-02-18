// https://www.acmicpc.net/problem/1874

import Foundation

let count: Int = Int(readLine()!)!
var reversedStack: [Int] = Array(2...count + 1).reversed()
var stack: [Int] = [1]
var answer: [Character] = ["+"]

for _ in 1...count {
    let number: Int = Int(readLine()!)!

    while reversedStack.last! <= number {
        stack.append(reversedStack.removeLast())
        answer.append("+")
    }

    if stack.last! == number {
        stack.removeLast()
        answer.append("-")
    } else {
        print("NO")
        answer = [] //  ⭐️⭐️⭐️ ➡️ exit(0) 으로 대체가능 = 28번줄의 print문에서 출력이 없게하려고 빈배열을 넣고 break 했는데, exit(0)으로 main 중단 
        break
    }
}

answer.forEach { print($0) }
