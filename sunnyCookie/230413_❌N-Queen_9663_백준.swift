import Foundation

// https://www.acmicpc.net/problem/9663

/*
퀸은 놓이면 가로선(행)을 모두 써버리므로 2차원배열을 -> 1차원 배열로 사용 -> ✅ 배열의 index를 행값으로 보기
대각선위치확인은 ✅ 두 좌표의 (행의 차 == 열의 차) 일 때 대각선에 있다고 봄 -> 1차원배열에서 Index차 == value의 차 일 때 대각선이 되는것
ex) N이 삼일 때 [1, 3] 은 0행의 1번에 퀸이있고, 2행의 3에 퀸이있는 것. 
      - Q - -
      - - - Q
    세번째 행에 올 수 있는 퀸 자리를 찾을 때([1, 3, ❓] 같은 열이면 안되므로 1, 3 이 올 수 없음. 그럼 2가 온다고 가정하면 대각선 확인을 위한 (행의 차 == 열의 차)를 따졌을 때, 
    ❓는 3행 2열인 것, 이 때 2행 3열 값과 대각선인지 비교(절댓값) -> (행의차 1) == (열의차 1) 이므로 대각선에 위치하고있음 -> 불가능! 
*/

let n: Int = Int(readLine()!)!
var answer: Int = 0

func recursion(queens: [Int]) {
    if queens.count == n {
        answer += 1
        return
    }

    for newY in 0..<n {                           // 다음 행의 Y 찾기
        if queens.count == 0 {                    // 빈배열로 들어왔을 때 처리
            recursion(queens: [newY])
            continue
        } else {
            var isAvailable: Bool = true          // 밑에서 for-in 구문을 돌면서 newY가 사용가능한지 flag로 체크

            for (x, y) in queens.enumerated() {   // 이미 저장되어있는 퀸들의 좌표를 돌면서 대각선, 세로선 확인
                let distanceX = queens.count - x
                let distanceY = abs(newY-y)

                if y == newY || distanceX == distanceY { // 대각선에 있거나 세로선에 있으면 flag flase처리
                    isAvailable = false
                    break
                }
            }

            if isAvailable {                         // 앞선 퀸들의 동선에 겹치지 않는게 확인되면 newY추가 후 재귀
                recursion(queens: queens + [newY])
            }
        }
    }
}

recursion(queens: [])
print(answer)


// 풀이: https://m.blog.naver.com/gustn3964/222135242929
