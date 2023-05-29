//https://school.programmers.co.kr/learn/courses/30/lessons/76501

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for (absolute, sign) in zip(absolutes, signs) {
        result += sign ? absolute : -absolute
    }
    
    return result
}
