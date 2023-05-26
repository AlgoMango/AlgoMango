import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for (num, sign) in zip(absolutes, signs) {
        result += sign == true ? num : -num
    }
    
    return result
}
