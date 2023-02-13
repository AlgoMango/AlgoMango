//
// 백준 : https://www.acmicpc.net/problem/10808
//

var count: [Int] = .init(repeating: 0, count: 26)
let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
let input = readLine()!

input.forEach {
    let index = alphabets.firstIndex(of: $0)
    count[index!] += 1
}
count.forEach { print($0, terminator: " ") }
