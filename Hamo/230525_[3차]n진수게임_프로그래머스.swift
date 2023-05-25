func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var allAnswers: [String] = []
    var result: String = ""
    
    for num in 0...(t * m) {
        let temp = String(num, radix: n).map { String($0).uppercased() }
        allAnswers += (temp)
    }
    
    var tubeOrder = p - 1

    for _ in 1...t {
        result += allAnswers[tubeOrder]
        
        tubeOrder += m
    }
    
    return result
}
