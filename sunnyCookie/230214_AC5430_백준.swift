// https://www.acmicpc.net/problem/5430

/*
문제이해
     AC는 정수 배열을 연산하기 위한 새로운 언어로 이 언어에는 두 가지 함수 R(뒤집기)과 D(버리기)가 있다.
      - R: 배열 순서 뒤집기
      - D: 배열 첫번째 수 버리기 ( 빈 배열에선 에러 )
          ex: RDD:배열을 뒤집은 다음 처음 두 수를 버리는 함수

     입력값:
      - 첫째 줄: 테스트 케이스의 개수 T (<= 100)
                = 아래 둘째줄 ~ 넷째줄을 반복할 횟수
      - 둘째 줄: 함수묶음이 주어짐 (1개 =< 함수갯수 <= 100,000개)
      - 셋째 줄: 주어질 배열의 원소 갯수 (0 ≤ n ≤ 100,000)
      - 넷째 줄: [x1,...,xn]형태로 정수 배열 (1 ≤ xi ≤ 100)

-------------------------------------------------------------------------------------
📝 풀이
    


*/

import Foundation

let times: Int = Int(readLine()!)!

for _ in 1...times {
    let functions: [Character] = Array(readLine()!)
    let numberCount: Int = Int(readLine()!)!
    var numbersInput: String = readLine()!     // [1,2,3]
    numbersInput.removeFirst()                 //  1,2,3]   
    numbersInput.removeLast()                  //  1,2,3 

    let numbers: [Int] = numbersInput.split(separator: ",")           // input에서는 띄어쓰기가 없으므로 "," 를 기준으로 쪼개고 Int로 변환   
                                     .map { Int(String($0)) ?? 0 }     

    var enqueue: [Int] = []         // 덱으로 사용 예정 [6, 7, 8, 9, 10]
    var dequeue: [Int] = []         //              [5, 4, 3, 2, 1]     
    var isRightOrder: Bool = true   // flag역할 - 원소를 삭제할 때, 배열을 뒤집으면(false일 때) enqueue의 last를 빼고, 뒤집어지지않아있으면(true일 때) enqueue의 last를 뺌
    var completed: Bool = false     // flag역할 - error 처리가 돼서 결과값을 print하지 않아도 될지, 마지막 결과값을 print할지

    for (index, number) in numbers.enumerated() {
        index <= numberCount/2 ? dequeue.append(number) : enqueue.append(number) // 반반나누어 enqueue, dequeue에 담음 (dequeue는 뒤집어놓기)
    }

    dequeue.reverse()  

    for function in functions {
        if function == "R" {
            isRightOrder = !isRightOrder
          
        } else if function == "D" {
            if enqueue.isEmpty && dequeue.isEmpty {
                print("error")
                completed = true
                break
            }

            if isRightOrder {
                if dequeue.isEmpty {
                    dequeue = enqueue.reversed()
                    enqueue.removeAll()
                }

                dequeue.removeLast()

            } else if !isRightOrder {
                if enqueue.isEmpty {
                    enqueue = dequeue.reversed()
                    dequeue.removeAll()
                }

                enqueue.removeLast()
            }
        }
    }

    if !completed {
        if isRightOrder {
            let numbersArrayForm = (dequeue.reversed() + enqueue).map { String($0) }.joined(separator: ",")
            print("[\(numbersArrayForm)]")
        } else {
            let numbersArrayForm = (enqueue.reversed() + dequeue).map { String($0) }.joined(separator: ",")
            print("[\(numbersArrayForm)]")
        }
    }
}
