// https://school.programmers.co.kr/learn/courses/30/lessons/42583?language=swift

/*
시간초과로 냅다 큐 구현해버리기..ㅠ

테스트 1 〉	통과 (0.56ms, 16.7MB)
테스트 2 〉	통과 (18.44ms, 17.3MB)
테스트 3 〉	통과 (0.03ms, 16.4MB)
*/

import Foundation

final class Node {  // ⭐️⭐️⭐️ final을 붙이면 속도가 빨라짐..!
    let value: Int
    var next: Node?

    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

final class Queue {
    var head: Node? = nil
    var trail: Node? = nil

    func dequeue() -> Int {
        let value = head?.value
        head = head?.next

        return value!
    }

    func enqueue(node: Node) {
        guard head != nil else {
            head = node
            trail = node
            return
        }

        trail?.next = node
        trail = trail?.next
    }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var queue = Queue()
    var trucks: [Int] = truck_weights.reversed()
    var total: Int = 0
    var time: Int = 0
    var count: Int = 0

    while !trucks.isEmpty {
        let truck = trucks.removeFirst()

        while true {
            if count == bridge_length {
                total -= queue.dequeue()
                count -= 1
            }
          
            count += 1
            time += 1

            if total + truck <= weight {
                queue.enqueue(node: Node(value: truck))
                total += truck
                break
            } else {
                queue.enqueue(node: Node(value: 0))
            }
        }
    }

    time += bridge_length
    return time
}

/*
---------------------------------------------------------------------------
*/


/*
큐 구현없는 코드 ➡️ 시간 2배

테스트 1 〉	통과 (1.63ms, 16.3MB)
테스트 2 〉	통과 (78.27ms, 16.5MB)
테스트 3 〉	통과 (0.07ms, 16.4MB)
*/

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: bridge_length)
    var time = 0
    var trucks = truck_weights
    var totalweight = 0

    while !bridge.isEmpty {
        time += 1
        let first = bridge.removeFirst()
        totalweight -= first

        if !trucks.isEmpty {
            if let firstTruck = trucks.first {
                if totalweight + firstTruck <= weight {
                    bridge.append(trucks.removeFirst())
                    totalweight += firstTruck
                } else {
                    bridge.append(0)
                }
            }
        }
    }

    return time
}

/*
---------------------------------------------------------------------------
*/

//시간초과

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridges: [Int] = []
    var trucks: [Int] = truck_weights.reversed()
    var time: Int = 0

    while !trucks.isEmpty {
        let truck = trucks.removeLast()

        while true {
            time += 1

            if bridges.count == bridge_length {
                bridges.removeFirst()
            }

            let totalWeight = bridges.reduce(0, +)

            if totalWeight + truck <= weight {
                bridges.append(truck)
                break
            } else {
                bridges.append(0)
            }
        }
    }

    time += bridge_length

    return time
}
