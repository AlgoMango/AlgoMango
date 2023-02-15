import Foundation

let count = readLine()!
let numberArray = readLine()!.components(separatedBy: " ")
let target = readLine()!
let resultArray = numberArray.filter { $0 == target }

print(resultArray.count)
