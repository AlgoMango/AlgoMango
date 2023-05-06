//230506_귤고르기_프로그래머스
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict: [Int:Int] = [:]
    
    for item in 0..<tangerine.count {
        if dict[tangerine[item]] == nil {
            dict[tangerine[item]] = 1
        } else {
            dict[tangerine[item]]! += 1    
        }
    }
    
    var array: [Int] = []
    for item in dict {
        array.append(item.value)
    }
    
    array = array.sorted(by: >)
    
    var total = 0
    for index in 0..<array.count {
        total += array[index]
        if total >= k {
            return index + 1
        }   
    }
    
    return 0
}
