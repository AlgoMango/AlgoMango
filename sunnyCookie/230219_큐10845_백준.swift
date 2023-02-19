// https://www.acmicpc.net/problem/10845

import Foundation

let count: Int = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...count {
    var input = readLine()!

    switch input {
    case "pop":
      stack.isEmpty ? print(-1) : print(stack.removeFirst())  // removeFirst는 O(N)
//         if stack.isEmpty {
//             print(-1)
//         } else {
//             stack = stack.reversed()   // ⭐️⭐️⭐️  reversed()는 O(1)이라고 적혀있는데,
//             print(stack.removeLast()) // reversed를 새로운 상수에 담았을 때의 ReversedCollection<[Int]>로 사용할때만임.(removeLast()같은 메서드 사용불가) 타입을 명시해줘야함 
//             stack = stack.reversed()  // 이렇게 다시 원래 stack (type: [Int])에 담아주면 O(N)임
//         }
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
