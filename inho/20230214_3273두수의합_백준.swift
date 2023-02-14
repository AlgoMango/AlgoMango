//투포인터, O(n)

let count = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }.sorted()
let targetNumber = Int(readLine()!)!
var result = 0

var start = 0
var last = count - 1

while start < last {
    let currentNumber = numbers[start] + numbers[last]
    
    if currentNumber == targetNumber {
        result += 1
        start += 1
        last -= 1
    } else if currentNumber > targetNumber {
        last -= 1
    } else {
        start += 1
    }
}

print(result)
