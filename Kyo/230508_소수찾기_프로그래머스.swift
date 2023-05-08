//230508_소수찾기_프로그래머스

import Foundation
var primeBoard: [Bool] = []

func solution(_ numbers:String) -> Int {
    
    var maxNumber = numbers.map { String($0) }.sorted(by: >).joined()
    primeBoard = Array(repeating: true, count: Int(maxNumber)! + 1)
    setPrimeBoard()
    
    var answer = 0
    for index in 1..<primeBoard.count {
        if !primeBoard[index] { continue } // 소수가 아니면 체크조차안한다.
        //numbers 배열로 index를 만들 수 있나 없나 check
        if isValid(target: index, numbers: numbers) {
            answer += 1
        }
    }
    
    return answer
}

func isValid(target: Int, numbers: String) -> Bool {
    var numbersArray = numbers.map { String($0) }
    var targetArray = String(target).map { String($0) }
    
    var count = 0
    for target in targetArray {
        if numbersArray.contains(target) {
            let index = numbersArray.firstIndex(of: target)
            numbersArray[index!] = ""
            count += 1
        }
    }
    
    return count == targetArray.count ? true : false
}

// 소수확인 Board 셋팅
func setPrimeBoard() {
    // 0, 1은 소수아니다. 
    primeBoard[0] = false 
    primeBoard[1] = false
    
    var index = 2
    for index in 2..<primeBoard.count / 2 {
        if !primeBoard[index] { continue }
        
        for index2 in stride(from: index * index, to: primeBoard.count, by: index) {
            primeBoard[index2] = false  // 소수가 아님
        }
    }
}
