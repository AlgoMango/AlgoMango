//230508_압축_프로그래머스

func solution(_ msg:String) -> [Int] {
    
    var lzw: [String:Int] = [
        "A" : 1, "B" : 2, "C": 3, "D": 4, "E" : 5, "F" : 6,
        "G" : 7, "H" : 8, "I" : 9, "J" : 10, "K" : 11, "L" : 12, 
        "M" : 13, "N": 14, "O" : 15, "P": 16, "Q" : 17, "R": 18, 
        "S" : 19, "T" : 20, "U" : 21, "V" : 22, "W" : 23,
        "X" : 24, "Y" : 25, "Z" : 26
    ]
    
    var answer: [Int] = []
    var msgArray = msg.map { String($0) }
    
    var current: String = ""
    
    var index = 0
    
    var flag = false
    while index < msgArray.count {
        current += msgArray[index]
        
        if lzw[current] == nil {
            flag = false
            lzw[current] = lzw.count + 1
            current = ""  // 새로 사전에 넣을 경우 리셋
        } else {
            if flag { answer.removeLast() } // 연속으로 사전에 있는 경우 그 전 답 삭제
            answer.append(lzw[current]!)
            index += 1
            flag = true
        }
    }
    
    return answer
}
