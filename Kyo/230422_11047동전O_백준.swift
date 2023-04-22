//230422_11047동전O_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let k = input[1]

var coin: [Int] = []

for _ in 0..<n {
    let value = Int(readLine()!)!
    coin.append(value)
}

var answer = 0
var total = k

coin.sort(by: >)

for value in coin {
    if total == 0 { break }
    
    if value > total { continue }
    
    let need = total / value    // 필요한 코인 갯수
    total = total - (need * value)
    answer += need
}

print(answer)

