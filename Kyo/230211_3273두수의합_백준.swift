//230211_3273두수의합_백준

let numberCnt = Int(readLine()!)!
var numbers: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let xNum = Int(readLine()!)!

numbers.sort(by: <)

var left = 0
var right = numbers.count - 1

var result = 0

while left < right {
    if numbers[left] + numbers[right] == xNum {
        result += 1
        left += 1
        right -= 1
    } else if numbers[left] + numbers[right] < xNum {
        left += 1
    } else if numbers[left] + numbers[right] > xNum {
        right -= 1
    }
}

print(result)
