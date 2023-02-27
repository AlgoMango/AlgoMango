// https://www.acmicpc.net/problem/3190
/*
문제이해
    N*N 격자에서 왼쪽 위를 (1,1)로 1초마다 한칸씩 움직이는 뱀이있다. 사과를 먹으면 뱀의 길이가 한 칸 커지고, 벽이나 자신의몸을 만나면 종료된다.
------------------------------------------------------------------------------
런타임오류
    사과의 수 0개일 경우 처리하기

풀이
    뱀의 위치를 [[Int]]배열 변수로 선언하고, direction은 enum으로 정리해 방향전환, 방향에 따른 다음 포인트를 return하는 메서드를 구현해서 사용함. 
    input으로 주어진 모든 방향전환이 끝나고도, 마지막에 정해진 방향으로 계속 움직여야하므로 추가해야함
*/

import Foundation

let boardSize: Int = Int(readLine()!)!   
let appleNumber: Int = Int(readLine()!)!
var apples: Dictionary<[Int], Int> = [:]

if appleNumber >= 1 { // 사과의 수 0개일 경우 처리하기
    for _ in 1...appleNumber {
        let apple: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        apples[apple] = 1
    }
}

let directionChangeNumber: Int = Int(readLine()!)! 
var directions: [(count: Int, direction: String)] = []

for _ in 1...directionChangeNumber {  // input으로 주어지는 count와 direction담기)
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    directions.append((Int(input[0])!, input[1]))
}

directions.append((Int.max, "keepGoing")) // ⭐️⭐️⭐️ input으로 주어진 모든 방향전환이 끝나고도, 마지막에 정해진 방향으로 계속 움직여야하므로 추가해야함

var enqueue: [[Int]] = []
var dequeue: [[Int]] = [[1,1]]
var time: Int = 0
var currentDirection: Direction = .right

var headPoint: [Int] {  // 뱀의 머리에 해당하는 포인트
    return dequeue.isEmpty ? enqueue.first! : dequeue.last!
}

for (count, direction) in directions {
    for _ in 1...(count - time) {
        time += 1
        let nextPoint = currentDirection.moveToDirection(before: headPoint)

        guard nextPoint[0] <= boardSize && nextPoint[1] <= boardSize,   // 다음 포인트(뱀의 머리가 될 포인트)가 격자의 바깥으로 벗어났는지 확인
              nextPoint[0] > 0 && nextPoint[1] > 0,
              !enqueue.contains(nextPoint) && !dequeue.contains(nextPoint) else { // 다음 포인트(뱀의 머리가 될 포인트)가 몸통을 만났는지 확인
            print(time)
            exit(0)
        }

        if apples[nextPoint] == 1 {     // 사과를 먹으면 몸이 한 칸 길어지므로 꼬리는 그대로고 헤드만 추가한다
            dequeue.append(nextPoint)
            apples[nextPoint] = nil
        } else {
            dequeue.append(nextPoint)   // 사과를 먹지않으면 헤드를 추가하고 꼬리를 삭제한다
            removeTrail()
        }
    }

    currentDirection = currentDirection.changeDirection(direction)
}

func removeTrail() {
    if enqueue.isEmpty {
        enqueue = dequeue.reversed()
        dequeue.removeAll()
    }

    enqueue.removeLast()
}

enum Direction {
    case up, down, right, left

    func moveToDirection(before: [Int]) -> [Int] {
        switch self {
        case .up:
            return [before[0] - 1, before[1]]
        case .down:
            return [before[0] + 1, before[1]]
        case .right:
            return [before[0], before[1] + 1]
        case .left:
            return [before[0], before[1] - 1]
        }
    }

    func changeDirection(_ leftRight: String) -> Direction {
        if leftRight == "D" {
            switch self {
            case .up:
                return .right
            case .down:
                return .left
            case .right:
                return .down
            case .left:
                return .up
            }
        } else if leftRight == "L" {
            switch self {
            case .up:
                return .left
            case .down:
                return .right
            case .right:
                return .up
            case .left:
                return .down
            }
        } else {  // "keepGoing"이 들어올 시 지금 방향 그대로 리턴
            return self
        }
    }
}
