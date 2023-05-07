//230507_k진수에서소수개수구하기_프로그래머스

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    var changeNumberArray = changeK(number: n, k: k)
    
    var testArray: [String] = []
    var answer = 0
    
    for number in changeNumberArray {
        if number == "0" && testArray.count != 0 { 
            var result = checkPrime(Int(testArray.joined())!)
            if result { answer += 1 }
            testArray.removeAll()
        } else if number != "0" {
            testArray.append(number)
        }
    }
    
    // 남은 것 처리
    if testArray.count != 0 {
        var result = checkPrime(Int(testArray.joined())!)
        if result { answer += 1 }
    }
    
    return answer
}

// 소수 판별 함수
func checkPrime(_ number: Int) -> Bool {
    
    if number == 1 { return false }
    
    for num in 2..<Int(sqrt(Double(number))+1  ) {
        if number % num == 0 {
            return false
        }
    }
    
    return true
}

// K진법으로 변경하는 함수
func changeK(number: Int, k: Int) -> [String] {
    var tempNumber = number
    
    var result: [String] = []
    while tempNumber > 0 {
        var num = tempNumber % k 
        result.append(String(num))
        tempNumber /= k
    }
    
    return result.reversed()
}
