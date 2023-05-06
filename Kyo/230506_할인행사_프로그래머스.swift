//230506_할인행사_프로그래머스
import Foundation

var constantDict: [String:Int] = [:]
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    // 자신이 원하는 제품과 수량이 할인하는 날짜와 10일 연속으로 일치할 경우에 맞춰서 회원가입을 하려 합니다.
    // 가능한 날이 없으면 0
    // 모두 할인 받을 수 있는 회원 등록 날짜의 일수를 Return
    
    // 0~9, 1 ~ 10, 2 ~ 11 검사
    
    var answer = 0
    initialDict(want: want, number: number)
    var dict: [String:Int] = [:]
    dict = constantDict
    
    var start = 0
    while start + 10 <= discount.count {
        for index in start..<start+10 {
            if dict[discount[index]] == nil { 
                continue 
            }
            
            dict[discount[index]]! -= 1
        }
        
        var flag = true
        for item in want {
            if dict[item]! != 0 {
                flag = false 
                break
            }
        }
        
        if flag { answer += 1 }
        
        dict = constantDict
        start += 1
    }
    
    return answer
}

func initialDict(want:[String], number: [Int]) {
    for index in 0..<want.count {
        constantDict[want[index]] = number[index]
    }
}
