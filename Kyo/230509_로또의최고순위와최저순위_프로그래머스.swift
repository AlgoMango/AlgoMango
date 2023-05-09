//230509_로또의최고순위와최저순위_프로그래머스
import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    // 1~45숫자중 6개 찍어서 맞추기.
    // 최고 순위와 최저순위 알아보기
    // 알아볼 수 없는 번호는 0
    
    var bingo = 0
    var strange = 0
    
    for lot in lottos {
        if win_nums.contains(lot) {
            bingo += 1
            continue
        } 
        
        if lot == 0 { strange += 1 }
    }
    
    var dict: [Int:Int] = [6:1, 5:2, 4:3, 3:4, 2:5]
    
    return [dict[bingo+strange] ?? 6, dict[bingo] ?? 6]
}
