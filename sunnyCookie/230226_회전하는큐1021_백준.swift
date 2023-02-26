// https://www.acmicpc.net/problem/1021

/*
문제이해
   첫째 줄: 큐의 크기(<= 50) + 뽑아내려는 수의 개수 주어짐
   둘째 줄: 뽑아내려는 수의 위치 순서대로 주어

   큐에서 할 수 있는 것
   1번: 첫 번째 원소를 뽑아낸다. 이 연산을 수행하면, 원래 큐의 원소가 a1, ..., ak이었던 것이 a2, ..., ak와 같이 된다.
   2번: 왼쪽으로 한 칸 이동시킨다. 이 연산을 수행하면, a1, ..., ak가 a2, ..., ak, a1이 된다.
   3번: 오른쪽으로 한 칸 이동시킨다. 이 연산을 수행하면, a1, ..., ak가 ak, a1, ..., ak-1이 된다.
      >> 2번, 3번 연산을 몇 번 하는지 최솟값을 프린트하는 문제
--------------------------------------------------------------------------------------------------------

📝 풀이
  주어진 숫자의 index가 전체 갯수의 절반 이하면⬇️, 해당 숫자가 나올 때 까지 왼쪽으로 회전(= 2번 연산)한다.
                             절반 이상이면⬆️  해당 숫자가 나올 때 까지 오른쪽으로 회전(= 3번 연산)한다. 
  
  회전 시, removeFirst() O(N)을 피하기 위해서 두 개의 덱을 활용한다.
    enqueue 배열은 정방향으로 배열위 뒷부분을 가진다. // ex. [6, 7, 8, 9, 10]
    duqueue 배열은 역방향으로 배열의 앞부분을 가진다. // ex .[5, 4, 3, 2, 1]

  1번 연산에서 말하는 첫번째 원소는 늘 duqueue의 마지막 원소이기 때문에, dequeue가 비워지지 않음을 보장해야한다.
*/

import Foundation

let orders: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let totalCount = orders[0]
let half: Int = totalCount / 2

guard totalCount != 1 else {  //⭐️⭐️⭐️  37~ 38번줄에서 half + 1이 total Count보다 작거나 같아야하고,  half가 1보다 크거나 같아야함을 보장해야해서 
    print(0)                  //        totalCount가 1일때( = half가 0 이 될 때)를 처리해준다.
    exit(0)
}

var enqueue: [Int] = Array((half + 1)...totalCount)           
var dequeue: [Int] = Array(1...half).reversed()               
var queueCount: Int { return enqueue.count + dequeue.count }

var answer: Int = 0

let searchingNumbers = readLine()!.split(separator: " ").map { Int($0)! }

for number in searchingNumbers {
    var numberIndex: Int = 0    // index 변수 선언

    if dequeue.contains(number) {  
        numberIndex = (dequeue.count - 1) - dequeue.firstIndex(of: number)! // dequeue 부분에 number가 포함되어있으면 reversed()배열을 고려해 인덱스를 구한다.
    } else {                      
        numberIndex = (dequeue.count) + enqueue.firstIndex(of: number)! // dequeue 부분에 없으면, enqueue에 있는거라 dequeue배열 갯수를 추가한다.
    }

    while dequeue.last! != number {
        numberIndex <= (queueCount / 2) ?  moveLeft() : moveRight() // 절반 이하면⬇️ 왼쪽회전, 이상이면⬆️ 
    }

    removeNumber()
}

func removeNumber() {         // 큐의 첫번째 값 삭제하는 메서드, dequeue에서 삭제하므로 dequeue가 비지 않도록 fillDequeueIfEmpty() 해준다
    dequeue.removeLast()
    fillDequeueIfEmpty()
}

func moveLeft() {             // 큐 왼쪽으로 돌리는 메서드, dequeue에서 삭제하므로 dequeue가 비지 않도록 fillDequeueIfEmpty() 해준다
    answer += 1
    enqueue.append(dequeue.removeLast())
    fillDequeueIfEmpty()
}

func moveRight() {          // 큐 오른쪽으로 돌리는 메서드, enqueue에서 삭제하는데 enqueue가 비어있으면 dequeue의 첫번째 값을 맨뒤로 보낸다.
    answer += 1

    if enqueue.isEmpty {
        dequeue.append(dequeue.removeFirst())
    } else {
        dequeue.append(enqueue.removeLast())
    }
}

func fillDequeueIfEmpty() {   // dequeue 비어있으면 채우는 메서드
    if dequeue.isEmpty {
        dequeue = enqueue.reversed()
        enqueue.removeAll()
    }
}

print(answer)
