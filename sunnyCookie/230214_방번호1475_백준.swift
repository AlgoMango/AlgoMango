// https://www.acmicpc.net/problem/1475

import Foundation

let roomNumber = readLine()!
var numbers = Array(repeating: 0, count: 10)

for index in roomNumber {
    numbers[Int(String(index))!] += 1
}

let nineAndSix = Int(round((Double(numbers[9]) + Double(numbers[6])) / 2))

numbers[6] = nineAndSix
numbers[9] = nineAndSix

print(numbers.max()!)

// Double > Int 형변환시 소숫점 버림으로 
