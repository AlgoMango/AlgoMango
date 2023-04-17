//230417_1759암호만들기_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let l = input[0]    // 암호 길이
let c = input[1]    // 암호에 사용될 수 있는 문자들 종류 갯수

// input2
var secret = readLine()!.split(separator: " ").map { String($0) }
secret.sort(by: <)

var array = Array(repeating: " ", count: l)
var visit = Array(repeating: false, count: c)
var answer = ""

recursive(number: 0, start: 0)
print(answer)

func recursive(number: Int, start: Int) {
    if number == l {
        if !check(array: array) { return }
        
        answer += array.joined()
        answer += "\n"
        return
    }
    
    for index in start..<secret.count {
        if visit[index] { continue }
        
        visit[index] = true
        array[number] = secret[index]
        
        recursive(number: number + 1, start: index + 1)
        
        visit[index] = false
    }
}

func check(array: [String]) -> Bool {
    var checkPoint = 0
    for item in array {
        if ["a", "e", "i", "o", "u"].contains(item) {
            checkPoint += 1 // 모음 갯수
        }
    }
    
    // 모음이 없을 때,
    if checkPoint == 0 { return false }
    
    // 자음이 두 개 미만 일 경우
    if array.count - checkPoint < 2 { return false }
    
    return true
}

