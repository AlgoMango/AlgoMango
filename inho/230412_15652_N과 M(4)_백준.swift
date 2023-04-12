//https://www.acmicpc.net/problem/15652

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0], m = input[1]
    var stack: [Int] = []
    var answer = ""

    func backTrack(i: Int) {
        if stack.count == m {
            answer += "\(stack.map({ String($0) }).joined(separator: " "))\n"
            return
        }

        (i...n).forEach {
            stack.append($0)
            backTrack(i: $0)
            stack.removeLast()
        }
    }

    backTrack(i: 1)
    print(answer)
}

solution()
