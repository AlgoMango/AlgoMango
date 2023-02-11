//230211_2577숫자의개수_백준
import Foundation

var inputs: [Int] = []
var total: Int = 1

for _ in 0..<3 {
    let input = Int(readLine()!)!
    inputs.append(input)
    total *= input
}

var result: [Int] = Array(repeating: 0, count: 10)

while total > 0 {
    result[total % 10] += 1
    total = total / 10
}

for number in result {
    print(number)
}
