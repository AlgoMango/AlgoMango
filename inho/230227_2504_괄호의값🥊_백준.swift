/*
 분배법칙 적용
 (()[[]])([]) -> 2*(2+3*(3+2*(3))) -> 2*2 + 2*3*3 + 2*3*2*3
 
 스택에는 일반적인 방법으로 추가/삭제
 stack : (  ->  ((  ->  (   ->  ([  ->  ([[   ->  ([  ->  (  ->    -> ...
 temp  : 2  ->  2*2 ->  2   ->  2*3 ->  2*3*3 ->  2*3 ->  2  -> 1  -> ...
 result: 0  ->  0   ->  4   ->  4   ->  4     ->  22  ->  22 -> 22 -> ...
*/

func solution() {
    let input = Array(readLine()!)
    let value: [Character: Int] = [")": 2, "(": 2, "[": 3, "]": 3]
    var stack: [Character] = []
    var temp = 1
    var result = 0
    
    for index in input.indices {
        if input[index] == "(" || input[index] == "[" {
            stack.append(input[index])
            temp *= value[input[index]]!
        } else if input[index] == ")" {
            if stack.isEmpty { //유효성 검사
                result = 0
                break
            } else if stack.last! == "(" {
                stack.removeLast()
                if input[index - 1] == "(" {
                    result += temp
                }
                temp /= value[input[index]]!
            } else if stack.last! == "[" { //유효성 검사
                result = 0
                break
            }
        } else if input[index] == "]" {
            if stack.isEmpty { //유효성 검사
                result = 0
                break
            } else if stack.last! == "[" {
                stack.removeLast()
                if input[index - 1] == "[" {
                    result += temp
                }
                temp /= value[input[index]]!
            } else if stack.last! == "(" { //유효성 검사
                result = 0
                break
            }
        }
    }
    
    print(stack.isEmpty ? result : 0)
}

solution()
