// BOJ 1158 요세푸스 문제
// https://www.acmicpc.net/problem/1158

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

var arr = Array(1...n)
var count = k - 1

print("<", terminator: "")
while arr.count != 1 {
    if count >= arr.count {
        count %= arr.count
    }
    
    print(arr.remove(at: count), terminator: ", ")
    count += (k - 1)
}

print(arr.first!, terminator: ">")
