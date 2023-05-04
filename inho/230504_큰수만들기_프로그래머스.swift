//https://school.programmers.co.kr/learn/courses/30/lessons/42883
//시간초과 난 풀이입니다,,ㅠㅅㅠ

func solution(_ number:String, _ k:Int) -> String {
    let count = number.count - k
    var numbers = number
    var index = 0
    var result = ""
    
    while result.count < (count) {
        let max = Array(numbers)[0...(numbers.count-count+index)].max()!
        
        index += 1
        numbers.removeFirst(Array(numbers).firstIndex(of: max)!+1)
        result += String(max)
    }
    
    return result
}
