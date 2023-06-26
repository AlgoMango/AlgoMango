//230626_13305주유소_백준
// 시작시간 17:15 - 17:28 (13분)
 
// MARK: - 문제
// 1키로마다 1리터의 기름을 사용, n개의 도시 존재
// 제일 왼쪽에서 오른쪽 도시로 이동

let city = Int(readLine()!)!
var length = readLine()!.split(separator: " ").map { Int(String($0))! }
var price = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = 0

// 작은 값으로 변경
for index in 0..<price.count {
    if index == price.count - 1 { break }
    if price[index] < price[index + 1]  {
        price[index + 1] = price[index]
    }
}

for index in 0..<length.count {
    answer += length[index] * price[index]
}

print(answer)
