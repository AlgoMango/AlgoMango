//230411_1182부분수열의합_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let s = input[1]

var answer = 0

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

func recursive(_ number: Int, total: Int) {
    if number == n {
        if total == s {
            answer += 1
        }
        return
    }
    
    recursive(number + 1, total: total)
    recursive(number + 1, total: total + board[number])
}

// s가 0일때는 바로 answer +=1 되니깐 1개 빼기
if s == 0 {
    answer -= 1
}

recursive(0, total: 0)
print(answer)
