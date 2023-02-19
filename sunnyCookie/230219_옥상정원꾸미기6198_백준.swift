//https://www.acmicpc.net/problem/6198

import Foundation

let count: Int = Int(readLine()!)!
var answer: [Int] = Array(repeating: 0, count: count)
var indexStack: [Int] = []
var heightStack: [Int] = []

for index in 0..<count {
    let height: Int = Int(readLine()!)!

    while !heightStack.isEmpty {
        if height >= heightStack.last! {
            answer[indexStack.last!] = index - indexStack.removeLast() - 1
            heightStack.removeLast()
        } else {
            break
        }
    }

    indexStack.append(index)
    heightStack.append(height)
}

indexStack.forEach { index in     // ⭐️⭐️⭐️ 마지막에 index스택에 남아있는 값들도 아직 큰 건물을 못만나서 모두 볼 수 있는 상태기 때문에 그 건물 갯수를 더해줘야함. 
    answer[index] = count - index - 1
}

print(answer.reduce(0,+))


//
// 시간초과 (스택에 넣어줄 때마다, 기존 스택에 담겨있는 값들에 +1 씩 순회하는 방법)
//
//let count: Int = Int(readLine()!)!
//var answer: [Int] = Array(repeating: 0, count: count)
//var indexArray: [Int] = []
//var heightArray: [Int] = []
//
//for index in 0..<count {
//    let height: Int = Int(readLine()!)!
//
//    while !heightArray.isEmpty {
//        if height >= heightArray.last! {
//            heightArray.removeLast()
//            indexArray.removeLast()
//        } else {
//            break
//        }
//    }
//
//    indexArray.forEach { index in
//        answer[index] += 1
//    }
//
//    indexArray.append(index)
//    heightArray.append(height)
//}
//
//print(answer.reduce(0,+))
