// https://school.programmers.co.kr/learn/courses/30/lessons/12909?language=swift

// 1️⃣ stack 사용: TS 통과, 효율성 통과

func solution(_ s:String) -> Bool {
    var words: [Character] = Array(s)
    var stack: [Character] = []

    for index in 0..<words.count {
        if words[index] == "(" {
            stack.append("(")
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }

    return stack.isEmpty
}

/*
--------------------------------------------------------------------
*/

// 2️⃣ replacingOccurrence사용 : TS 통과, 효율성에서 시간초과
func solution(_ s:String) -> Bool {
    var word = s

    while word.contains("()") {
        word = word.replacingOccurrences(of: "()", with: "")
    }

    return word.isEmpty
}
