//230211_10807개수세기_백준

let cnt = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let targetNumber = Int(readLine()!)!
var result = 0

for number in numbers {
    if number == targetNumber {
        result += 1
    }
}

print(result)
