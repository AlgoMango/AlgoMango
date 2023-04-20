import Foundation

let count = Int(readLine()!)!
var arr: [Int] = []

for _ in 1...count {
    let input = Int(readLine()!)!
    
    arr.append(input)
}

func mergeSort(list: [Int]) -> [Int] {
    if list.count <= 1 {
        return list
    }
    
    let center: Int = list.count / 2
    let left: [Int] = Array(list[0..<center])
    let right: [Int] = Array(list[center..<list.count])
    
    return merge(left: mergeSort(list: left), right: mergeSort(list: right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            
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
mergeSort(list: arr).forEach { element in
    result += "\(element)\n"
}

print(result)
