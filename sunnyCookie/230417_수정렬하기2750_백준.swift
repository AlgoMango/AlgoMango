import Foundation

// https://www.acmicpc.net/problem/2750
// mergerSort 병합정렬사용

let n: Int = Int(readLine()!)!
var numbers: [Int] = []

for _ in 0..<n {
    let number: Int = Int(readLine()!)!
    numbers.append(number)
}

func mergeSort(_ numbers: [Int]) -> [Int] {
    guard numbers.count > 1 else { return numbers }

    let mid = numbers.count / 2
    let left = Array(numbers[0..<mid]) // ✅ ...mid로 하면 2개에서 1개로 내려가질 않음
    let right = Array(numbers[mid..<numbers.count])

    return merge(mergeSort(left), mergeSort(right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIdx: Int = 0
    var rightIdx: Int = 0
    var merged = [Int]()

    while true {
        if leftIdx == left.count {
            merged += right[rightIdx..<right.count]
            break
        }

        if rightIdx == right.count {
            merged += left[leftIdx..<left.count]
            break
        }

        if left[leftIdx] < right[rightIdx] {
            merged.append(left[leftIdx])
            leftIdx += 1
        } else {
            merged.append(right[rightIdx])
            rightIdx += 1
        }
    }

    return merged
}

mergeSort(numbers).forEach { print($0) }
