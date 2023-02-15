//https://www.acmicpc.net/problem/10807

import Foundation

let numberCount = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let searchingNumber = Int(readLine()!)!
let result = 0

print(numbers.filter {  $0 == searchingNumber }.count)
