// https://school.programmers.co.kr/learn/courses/30/lessons/43165
// DFS방법도 알아두기..! (함수안의 함수넣기)

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var index: Int = 0
    var enqueue: [Int] = []
    var dequeue: [Int] = []

    while index < numbers.count {
        if enqueue.isEmpty && dequeue.isEmpty {
            enqueue.append(0 + numbers[index])
            enqueue.append(0 - numbers[index])
            index += 1
            continue
        }
        let count = enqueue.count
        dequeue = enqueue.reversed()
        enqueue.removeAll()

        for _ in 0..<count {
            let number = dequeue.removeLast()
            enqueue.append(number + numbers[index])
            enqueue.append(number - numbers[index])
        }


        index += 1
    }

    return enqueue.filter { $0 == target }.count
}

print(solution([4, 1, 2, 1], 4))
