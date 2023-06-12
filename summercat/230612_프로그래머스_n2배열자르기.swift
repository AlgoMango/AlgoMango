// 다시풀기

import Foundation

// 10_000_000
// Swift의 Int.max는 10^18까지 표현이 가능하기 때문에 문제의 범위가 Int 내에서 해결 가능함

// 1 2 3 4 5
// 2 2 3 4 5
// 3 3 3 4 5
// 4 4 4 4 5
// 5 5 5 5 5

// i번째 행의 구성요소는 (i - 1)가 (i - 1)개 그리고 i ~ (n - 1)
// i번째 행의 startIndex는 n * i

// left/right를 n으로 나눈 몫 = 행, 나머지 = 열

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var answer: [Int] = []
    
    for index in Int(left)..<Int(right)+1 {
        let reminder = index % n    
        let quotient = index / n
        
        answer.append(max(quotient + 1, reminder + 1))
    }
    
    return answer
}
