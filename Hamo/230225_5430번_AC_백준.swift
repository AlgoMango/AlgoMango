// 1 -> 테스트 케이스의 개수
// 2 -> 수행할 함수 p
// 3 -> 배열에 들어있는 수의 개수 n
// 4 -> 배열에 들어있는 정수가 주어진다.

import Foundation

let testCaseCount = Int(readLine()!)!
var results: [String] = []

for _ in 1...testCaseCount {
    let functions = readLine()!.map { String($0) }
    let numberCount = Int(readLine()!)!

    let numbers: [Int] = readLine()!
        .trimmingCharacters(in:["[", "]"])
        .split(separator: ",", omittingEmptySubsequences: true)
        .map { Int($0)! }
    
    var isFront = true
    var frontIndex = 0
    var backIndex = numbers.count - 1
    var deleteCount = 0
    
    if numbers.isEmpty && functions.contains("D") {
        results.append("error")
        continue
    }
    
    var isError = false

    for function in functions {
        switch function {
        case "D":
            if isFront {
                frontIndex += 1
            } else {
                backIndex -= 1
            }
            
            deleteCount += 1
        case "R":
            isFront.toggle()
        default:
            break
        }
        
        if deleteCount > numbers.count {
            results.append("error")
            isError = true
            break
        }
    }
    
    if isError {
        continue
    }

    if !numbers.isEmpty && deleteCount < numbers.count {
        if isFront {
            results.append("\(numbers[frontIndex...backIndex])".components(separatedBy: " ").joined())
        } else {
            let result: [Int] = numbers[frontIndex...backIndex].reversed()
            results.append("\(result)".components(separatedBy: " ").joined())
        }
    } else {
        results.append("[]")
    }
}

print(results.joined(separator: "\n"))
