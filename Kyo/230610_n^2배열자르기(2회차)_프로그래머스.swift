230610_n^2배열자르기(2회차)_프로그래머스

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var left = Int(left)
    var right = Int(right)
    var answer: [Int] = []
    
    // 나머지, 몫 중에서 큰거로 선택
    for value in left..<right+1 {
        answer.append(max(value % n, value / n) + 1)
    }
   
    return answer
}
