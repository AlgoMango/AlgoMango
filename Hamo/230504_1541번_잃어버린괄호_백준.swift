import Foundation

var input = readLine()!.map { $0 }
var numbers: [Int] = []

var num = ""

for character in input {
    if !character.isNumber {
        numbers.append(Int(num)!)
        num = ""
    }
    
    num += String(character)
}

numbers.append(Int(num)!)

var minResult = numbers.reduce(0, +)
var sum = 0

for (index, element) in numbers.enumerated() {
    if element < 0 {
        minResult = min(minResult, sum + (-1 * Array(numbers[index..<numbers.count]).map({ abs($0) }).reduce(0, +)))
    }
    
    sum += element
}

print(minResult)
