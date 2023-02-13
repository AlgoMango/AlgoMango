import Foundation

let input = readLine()!.map { Int(String($0))! }
var roomNumberArray = Array(repeating: 0, count: 9)
var maxNumber = 0

for index in input {
    if index == 9 {
        roomNumberArray[6] += 1
        continue
    }
    
    roomNumberArray[index] += 1
}

roomNumberArray[6] = Int(ceil(Double(roomNumberArray[6]) / 2))

for element in roomNumberArray {
    if element > maxNumber {
        maxNumber = element
    }
}

print(maxNumber)
