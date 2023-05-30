// 시작 12:22
import Foundation

/*
비트가 1개 또는 2개 다른 수 중 가장 작은 수 >
0을 포함한 경우: 0을 1로 바꾼 수 또는 0 바로 다음자리의 1을 1로 바꾸고, 0이 1이 된 경우
0을 포함하지 않은 경우: 맨 앞의 1을 0으로 바꾸고 맨 앞에 1 붙임
*/
var answer: [Int64] = []

func solution(_ numbers:[Int64]) -> [Int64] {
    for number in numbers {
        let binary = toBinary(number)
        let result = f(binary)
        answer.append(result)
    }
    
    return answer
}

func toBinary(_ number: Int64) -> [Character] {
    return Array(String(number, radix: 2))
}

func f(_ binary: [Character]) -> Int64 {
    let size = binary.count
    var copy = binary
    
    if binary[size - 1] == "0" {
        copy[size - 1] = "1"
        let result: Int64 = Int64(String(copy), radix: 2)!
        return result
    }
    
    if !binary.contains("0") {
        copy[0] = "0"
        copy.insert("1", at: 0)
        let result: Int64 = Int64(String(copy), radix: 2)!
        return result
    }

    for i in (0..<binary.count).reversed() {
        if binary[i] == "0" {
            copy[i] = "1"
            copy[i + 1] = "0"
            let result: Int64 = Int64(String(copy), radix: 2)!
            return result
        }
    }
    
    return 0
}
