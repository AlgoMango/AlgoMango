//230215_2470두용액_백준

var testCase = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

numbers.sort(by: <)

var answer: [Int] = [0, 0]
var minValue = 2000000000
var left = 0
var right = testCase - 1

while left < right {
    let value = numbers[left] + numbers[right]
    
    if value > 0 {
        if abs(value) < minValue {
            minValue = abs(value)
            answer[0] = numbers[left]
            answer[1] = numbers[right]
        }
        right -= 1
    } else if value < 0 {
        if abs(value) < minValue {
            minValue = abs(value)
            answer[0] = numbers[left]
            answer[1] = numbers[right]
        }
        left += 1
    } else if value == 0 {
        answer[0] = numbers[left]
        answer[1] = numbers[right]
        break
    }
}

print(answer[0], answer[1])
