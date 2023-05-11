//230511_다트게임_프로그래머스

func solution(_ dartResult:String) -> Int {
    // 숫자 배열 만들기
    // 명령어 배열 만들기 
    var numberFlag = false
    var numbers: [Int] = []
    var commands: [String] = []
    
    var darts = dartResult.map { String($0) }
    
    for index in 0..<darts.count {
        if Int(darts[index]) == nil {
            numberFlag = false 
            commands.append(darts[index])
            continue 
        }
        
        if numberFlag == true { // 연속해서 숫자면 10
            numbers.removeLast()
            numbers.append(10)    
        } else {
            numberFlag = true
            numbers.append(Int(darts[index])!)     
        }
    }
    
    var result: [Int] = []
    var numberIndex = 0
    for index in 0..<commands.count {
        var command = commands[index]
        
        switch command {
            case "S":
                result.append(numbers[numberIndex])
                result[numberIndex] = result[numberIndex]
                numberIndex += 1
            case "D":
                result.append(numbers[numberIndex])
                result[numberIndex] = result[numberIndex] * result[numberIndex] 
                numberIndex += 1
            case "T":
                result.append(numbers[numberIndex])
                result[numberIndex] = result[numberIndex] * result[numberIndex] * result[numberIndex] 
                numberIndex += 1
            
            case "*":
                result[numberIndex - 1] *= 2
                if result.count > 1 {
                    result[numberIndex - 2] *= 2
                }
            case "#":
                result[numberIndex - 1] =  result[numberIndex - 1] * -1
            default:
                continue
        }
    }
    
    var answer = 0
    for item in result {
        answer += item
    }
    
    return answer
}
