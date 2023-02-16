import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let numberCount = input[0]
let offSet = input[1]

var numbers: [Int] = Array(1...numberCount)
var stack: [Int] = []
var results: [String] = []

numbers = numbers.reversed()

var index = 1

while !numbers.isEmpty {
    let number = numbers.removeLast()

    if index == offSet {
        results.append(String(number))
        index = 1
    } else {
        stack.append(number)
        index += 1
    }

    if numbers.isEmpty {
        numbers = stack.reversed()
        stack = []
    }
}


print("<", terminator: "")
print(results.joined(separator: ", "), terminator: "")
print(">")
