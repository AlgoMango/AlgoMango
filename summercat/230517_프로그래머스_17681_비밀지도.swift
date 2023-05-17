// 벽은 or, 공백은 and

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var line: String = ""
    
    for i in 0..<n {
        var first: [Character] = Array(String(arr1[i], radix: 2))
        var second: [Character] = Array(String(arr2[i], radix: 2))
        
        if first.count < n {
            var zeros: [Character] = Array(repeating: "0", count: n - first.count)
            first = zeros + first
        }
        
        if second.count < n {
            var zeros: [Character] = Array(repeating: "0", count: n - second.count)
            second = zeros + second
        }
        
        for j in 0..<n {
            first[j] == "0" && second[j] == "0" ? line.append(" ") : line.append("#")
        }

        answer.append(line)
        line = ""
    }
    
    return answer
}
