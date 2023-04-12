//https://www.acmicpc.net/problem/15650

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0], m = input[1]
    var visited = Array(repeating: false, count: n)
    var result = Array(repeating: 0, count: m)
    
    func backTrack(i: Int) {
        if i == m {
            if result.sorted() == result { //꼼수 풀이인듯 합니다,,,
                print(result.map({ String($0) }).joined(separator: " "))
                return
            }
            return
        }

        (1...n).forEach {
            if !visited[$0-1] {
                result[i] = $0
                visited[$0-1] = true
                backTrack(i: i+1)
                visited[$0-1] = false
            }
        }
    }
    
    backTrack(i: 0)
}

solution()
