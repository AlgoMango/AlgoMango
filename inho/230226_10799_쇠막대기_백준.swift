//https://www.acmicpc.net/problem/10799

func solution() {
    let input = readLine()!.replacingOccurrences(of: "()", with: "|") //레이저를 |로 변경
    var stack: [Character] = []
    var result = 0
    
    input.forEach {
        if $0 == "(" { // 여는 괄호마다 막대 추가
            stack.append($0)
            result += 1
        } else if $0 == "|" { // 레이저를 만나면 모든 막대가 반갈죽
            result += stack.count
        } else if $0 == ")" {
            stack.removeLast() // 끝난 막대는 스택에서 제거
        }
    }
    
    print(result)
}

solution()
