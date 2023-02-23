//
// 프로그래머스: 올바른 괄호 
// 🔗: https://school.programmers.co.kr/learn/courses/30/lessons/12909


// TC
 "()()"    true
 "(())()"    true
 ")()("    false
 ")()("    false

// 1차 시도 효율성 탈락 ⛔️

func solution(_ s:String) -> Bool {
    var queue: [String] = []
    
    if s.first == ")" && s.last == ")" {
        return false
    }
    for i in s {
        if i == "(" {
            queue.append("(")
            continue
        }
        if i == ")" && queue.last == "(" {
            queue.popLast()
        }
    }
    return queue.isEmpty
}

// 2차 시도 성공 ✅

func solution(_ s:String) -> Bool {
    var o = 0
    
    if s.first == ")" && s.last == ")" {
        return false
    }
    for i in s {
        if i == "(" {
            o += 1
            continue
        }
        if i == ")" && o != 0 {
            o -= 1
        }
    }
    return o == 0
}
