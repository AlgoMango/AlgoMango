//230506_콜라문제_프로그래머스
import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    // 마트에 줘야하는 병수가 a
    // 마트가 주는 병수가 b
    // n은 초기 빈 병
    
    var need = a
    var total = 0
    var current = n
    
    while current >= need {
        // if current % need == 0 {
        //     current = (current / need) * b
        //     total += current // 받은 수 
        // } else {
            total += (current / need) * b // 받은 수 
            current = (current / need) * b + (current % need)
        // }
    }
    
    return total
}
