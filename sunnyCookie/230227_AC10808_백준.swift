// https://www.acmicpc.net/problem/5430

/*
문제이해
    AC는 정수 배열에 연산을 하기 위해 만든 언어이고 두 가지 함수가 있다.
      - R (뒤집기): 배열에 있는 수의 순서를 뒤집는 함수 
      - D (버리기): 첫 번째 수를 버리는 함수
      ex) "RDD"는 배열을 뒤집은 다음 처음 두 수를 버리는 함수다.

    첫째 줄에 테스트 케이스의 개수(T) (최대 100)가 주어진다.
     
    둘재 줄~네번째 줄을 T번 반복:
      둘째 줄: 수행할 함수 p가 주어진다. (1 ≤ p ≤ 100,000)
      셋째 줄: 배열에 들어있는 수의 개수 n (0 ≤ n ≤ 100,000)
      넷째 줄: [x1,...,xn]과 같은 형태로 배열에 들어있는 정수가 주어진다. (1 ≤ xi ≤ 100)
       >> 각 테스트 케이스에 대해서, 입력으로 주어진 정수 배열에 함수를 수행한 결과를 출력한다. (만약, 에러가 발생한 경우에는 error를 출력한다.)    
   
*/


import Foundation

let times: Int = Int(readLine()!)!

for _ in 1...times {
    let functions: [Character] = Array(readLine()!)
    let numberCount: Int = Int(readLine()!)!
    var numbersInput: String = readLine()!    //[1,2,3,4] String
    numbersInput.removeFirst()                // 1,2,3,4] String
    numbersInput.removeLast()                 // 1,2,3,4  String

    let numbers: [Int] = numbersInput.split(separator: ",")
                                     .map { Int(String($0)) ?? 0 } // [1, 2, 3, 4] Array

    var enqueue: [Int] = []
    var dequeue: [Int] = []
    var isRightOrder: Bool = true // 뒤집어진지를 flag로 지정 배열이 정방향이면(true이면) dequeue의 last값을 제거할거고, 역방향이면(false) enqueue의 last값을 제거할거다.
    var completed: Bool = false   // 중간에 error처리를 해준 것은 배열 결과 출력을 하지않기 위해 flag를 사용했다.

    for (index, number) in numbers.enumerated() {
        index <= numberCount/2 ? dequeue.append(number) : enqueue.append(number) // enqueue와 dequeue에 반반 나눠서 담아줌.
    }

    dequeue.reverse() // deck구현을위해 dequeue는 뒤집어놓는다 -> enqueue = [3, 4], dequeue = [2, 1] 

    for function in functions {
        if function == "R" {
            isRightOrder = !isRightOrder  // 실제 배열을 뒤집는대신 flag를 바꾼다.
        } else if function == "D" {
            if enqueue.isEmpty && dequeue.isEmpty { // queue들이 비어있으면 error를 출력하고 complted flag를 true로 바꿔준다.
                print("error")
                completed = true
                break
            }

            if isRightOrder { // 정배열 일 땐, dequeue의 마지막을 제거한다.
                if dequeue.isEmpty {
                    dequeue = enqueue.reversed()
                    enqueue.removeAll()
                }

                dequeue.removeLast()

            } else if !isRightOrder { // 역배열 일 땐, enqueue의 마지막을 제거한다.
                if enqueue.isEmpty {
                    enqueue = dequeue.reversed()
                    dequeue.removeAll()
                }

                enqueue.removeLast()
            }
        }
    }

    if !completed {  // 결과값을 프린트하기전에 위에서 에러처리를 했는지 확인 한다/
        if isRightOrder { // 정방향일 때와 역방향일 때로 나눠서 값을 프린트해준다.
            let numbersArrayForm = (dequeue.reversed() + enqueue).map { String($0) }.joined(separator: ",")
            print("[\(numbersArrayForm)]")
        } else {
            let numbersArrayForm = (enqueue.reversed() + dequeue).map { String($0) }.joined(separator: ",")
            print("[\(numbersArrayForm)]")
        }
    }
}
