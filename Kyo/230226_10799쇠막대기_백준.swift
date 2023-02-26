//230226_10799쇠막대기_백준

let input = readLine()!.map { String($0) }

var stack: [String] = []

var cnt = 0
var result = 0
var recent = ""

for index in 0..<input.count {
    
    switch input[index] {
    case "(":
        cnt += 1
    case ")":               //닫힌 괄호면 막대기의 끝부분이거나 레이저이다.
        cnt -= 1
        if recent == "(" {  // 레이저로 자른 부분 - 지금까지의 cnt를 더해줌
            result += cnt
        } else {            // 막대기의 끝 부분 - 막대기 끝부분 더해줌
            result += 1
        }
    default:
        continue
    }
    
    recent = input[index]
}

print(result)
