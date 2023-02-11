// BOJ 1475 방 번호
// https://www.acmicpc.net/problem/1475

let input = readLine()!
var numbers = Array(repeating: 0, count: 9)

for char in input {
    if char == "9" { numbers[6] += 1 }
    else { numbers[Int(String(char))!] += 1 }
}

if numbers[6] % 2 == 1 {
    numbers[6] = numbers[6] / 2 + 1
} else {
    numbers[6] /= 2
}

print(numbers.max()!)
