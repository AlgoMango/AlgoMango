import Foundation

let count = Int(readLine()!)!
var arr: [String] = []

for _ in 1...count {
    let input = readLine()!
    arr.append(input)
}

func mergeSort(list: [String]) -> [String] {
    if list.count <= 1 {
        return list
    }
    
    let center: Int = list.count / 2
    let left: [String] = Array(list[0..<center])
    let right: [String] = Array(list[center..<list.count])
    
    return merge(left: mergeSort(list: left), right: mergeSort(list: right))
}

func merge(left: [String], right: [String]) -> [String] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [String] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.count < rightElement.count {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.count > rightElement.count {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
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
        result += "\(element)\n"
    }

print(result)
