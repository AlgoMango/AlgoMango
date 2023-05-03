// https://www.acmicpc.net/problem/1541

let input = readLine()!.split(separator: "-")
var answer: Int = input[0].split(separator: "+").map { Int(String($0))! }.reduce(0,+)

for i in 1..<input.count {
    answer -= input[i].split(separator: "+").map { Int(String($0))! }.reduce(0,+)
}

print(answer)
