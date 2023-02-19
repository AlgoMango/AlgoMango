// https://www.acmicpc.net/problem/10845

import Foundation

let count: Int = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...count {
    var input = readLine()!

    switch input {
    case "pop":
      // 한 줄로 하려면 stack.isEmpty ? print(-1) : print(stack.removeFirst())  // removeFirst는 O(N)
        if stack.isEmpty {
            print(-1)
        } else {
            stack = stack.reversed().  // reversed(), removeLast는 O(1)인데 갯수가 적어서인지..시간에 크게 영향을 끼치지 않음.
            print(stack.removeLast())  // ⭐️⭐️⭐️ reversed를 새로운 상수에 담으면 타입은 ReversedCollection<[Int]>이므로 removeLast()같은 메서드 사용불가, 타입을 명시해줘야함
            stack = stack.reversed()
        }
    case "size":
        print(stack.count)
    case "empty":
        stack.isEmpty ? print(1) : print(0)
    case "front":
        stack.isEmpty ? print(-1) : print(stack.first!)
    case "back":
        stack.isEmpty ? print(-1) : print(stack.last!)
    default:
        let inputArray = input.split(separator: " ")
        let number = Int(inputArray[1])!
        stack.append(number)
    }
}
