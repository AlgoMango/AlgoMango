//230507_n진수게임_프로그래머스
/*
  1. 스트링보다는 배열로 쓰기..
  2. String(number, radix: n, uppercase: true)로 진법바꾸기 가능
*/

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var array: [String] = []
    var start = 0
    
    while array.count < t * m {
        let numberString = String(start, radix: n, uppercase: true).map { String($0) }
        array += numberString
        start += 1
    }
    
    var answer: String = ""    
    var arrayIndex = p - 1
    
    while answer.count < t {
        answer += array[arrayIndex]
        arrayIndex += m
    }

    return answer 
}

// number을 n진법으로
func change(number: Int, n: Int) -> String {
    var result = ""
    var target = number
    
    if number == 0 { return "0" }
    
    var array16 = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
        
    while target > 0 {
        var remain = target % n
        result += array16[remain]
        target /= n
    }
    
    return String(result.reversed())
}
