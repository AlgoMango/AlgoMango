// https://www.acmicpc.net/problem/1912
import Foundation

let n: Int = Int(readLine()!)!
let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

guard numbers.filter({ $0 > 0 }).count != 0 else {
    print(numbers.max()!)
    exit(0)
}

var count: [Int] = [numbers[0]]

for i in 1..<n {
    count.append(max(count[i-1] + numbers[i], 0))
}

print(count.max()!)
