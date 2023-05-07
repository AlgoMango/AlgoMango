//230507_기사단원의무기_프로그래머스
import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var answer = 0
    var array = foundWeapons(number: number)
    
    for index in 1..<array.count {
        if array[index] > limit {
            answer += power
            continue
        } 
        
        answer += array[index]
    }
    
    return answer
}

// 약수 갯수들 Return 
// 일일이 하나씩 세면 시간초과 발생
func foundWeapons(number: Int) -> [Int] {
    var array: [Int] = Array(repeating: 1, count: number + 1)
    
    for num in 1..<number+1 {
    
        // 제곱근이 딱 나눠 떨어지는지 
        var isSquare: Bool = Double(Int(sqrt(Double(num)))) == sqrt(Double(num))
        
        var count = 0
        
        // 제곱근을 기준
        for target in 1..<Int(sqrt(Double(num))) + 1 {
            if num % target == 0 {
                count += 1
            }        
        }
        
        array[num] = isSquare ? (count * 2) - 1 : count * 2
    }
    
    return array
}
