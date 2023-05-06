//230506_과일장수_프로그래머스
import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    // 상자에 담긴 사과 중 가장 낮은 점수가 p (1 ≤ p ≤ k)점인 경우, 사과 한 상자의 가격은 p * m 입니다.
    
    var sortScore: [Int] = score.sorted(by: <).reversed()
    
    // m개씩 포장
    var start = 0 
    var total = 0
    while start + m <= sortScore.count {
        total += sortScore[start + m - 1] * m // 최솟값 min구하면 n 제곱됨
        start += m
    }
    
    return total
}
