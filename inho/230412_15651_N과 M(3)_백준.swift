//https://www.acmicpc.net/problem/15651

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0], m = input[1]
    var result = Array(repeating: 0, count: m)
    var answer = ""
    
    func backTrack(i: Int) {
        if i == m {
            answer += "\(result.map({ String($0) }).joined(separator: " "))\n" //매번 print했더니 시간초과나서 print한번하도록 
            return
        }
        
        (1...n).forEach {
            result[i] = $0
            backTrack(i: i+1)
        }
    }
    
    backTrack(i: 0)
    print(answer)
}

solution()
