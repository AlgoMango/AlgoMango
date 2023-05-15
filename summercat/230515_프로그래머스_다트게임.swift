// 기회: 3번
// S, D, T
// *: 이전라운드 & 현재라운드 2배
// #: 해당라운드 마이너스
// 숫자는 0~10

var result: [Character] = []
var scores: [Int] = []

func solution(_ dartResult:String) -> Int {
    result = Array(dartResult)
    var idx: Int = 0
    var number: String = ""
    
    while idx < result.count {
        let current = result[idx]
        if current.isNumber {
            number += String(current)
            idx += 1
            continue
        }
        
        if !number.isEmpty {
            scores.append(Int(number)!)
            number = ""
        }
        
        let lastIndex = scores.count - 1
        idx += 1
        
        switch current {
        case "*":
            if lastIndex == 0 { scores[0] *= 2 }
            else {
                scores[lastIndex] *= 2
                scores[lastIndex - 1] *= 2
            }
        case "#":
            scores[lastIndex] *= -1
        case "S":
            continue
        case "D":
            scores[lastIndex] *= scores[lastIndex]
        case "T":
            scores[lastIndex] *= scores[lastIndex] * scores[lastIndex]
        default:
            continue
        }
    }

    return scores.reduce(0, +)
}
