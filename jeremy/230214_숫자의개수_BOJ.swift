//
// 백준 : https://www.acmicpc.net/problem/2577
//

var arr: [Int] = []
for _ in 0...2 {
    let input = Int(readLine()!)
    arr.append(input!)
}
let result = String(arr.reduce(1) { $0 * $1 }).map { $0 }
var nums = Array.init(repeating: 0, count: 10)
result.forEach { nums[$0.wholeNumberValue!] += 1 }

nums.forEach { print($0, separator: " ")}
