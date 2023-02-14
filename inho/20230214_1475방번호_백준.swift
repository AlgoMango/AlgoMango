import Foundation

let input = readLine()!
var numbers = Array(repeating: 0, count: 10)

for stringNumber in input {
    let number = Int(stringNumber.description)!
    
    numbers[number] += 1
}

numbers[9] = (numbers[9] + numbers[6] + 1) / 2
numbers[6] = 0

print(numbers.max()!)
