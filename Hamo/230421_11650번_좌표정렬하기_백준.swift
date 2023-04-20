import Foundation

let count = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

func mergeSort(list: [(Int, Int)]) -> [(Int, Int)] {
    if list.count <= 1 {
        return list
    }
    
    let center = list.count / 2
    let left = Array(list[0..<center])
    let right = Array(list[center..<list.count])
    
    return merge(left: mergeSort(list: left), right: mergeSort(list: right))
}

func merge(left: [(Int, Int)], right: [(Int, Int)]) -> [(Int, Int)] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [(Int, Int)] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.0 < rightElement.0 {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.0 > rightElement.0 {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else if leftElement.1 < rightElement.1 {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.1 > rightElement.1 {
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

var result = ""

mergeSort(list: arr)
    .forEach { element in
        result += "\(element.0) \(element.1)\n"
}

print(result)
