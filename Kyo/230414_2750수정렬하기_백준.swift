//230414_2750수정렬하기_백준

let input = Int(readLine()!)!

var array: [Int] = []
for _ in 0..<input {
    array.append(Int(readLine()!)!)
}


// MARK: - QuickSork 사용 : pivot 정하기
func quickSort(array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    
    // pivot
    let pivot = array[array.count / 2]
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    
    let newArray = quickSort(array: left) + [pivot] + quickSort(array: right)
    
    return newArray
}

//for item in quickSort(array: array) {
//    print(item)
//}


// MARK: - MergeSort 사용 : 반띵

func mergeSort(array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    
    let center = array.count / 2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    return merge(left: mergeSort(array: left), right: mergeSort(array: right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var left = left
    var right = right
    var result: [Int] = []
    
    while !left.isEmpty && !right.isEmpty {
        if left[0] > right[0] {
            result.append(right[0])
            right.removeFirst()
        } else {
            result.append(left[0])
            left.removeFirst()
        }
    }
    
    if !left.isEmpty { // 왼쪽 배열의 요소가 남은 경우
        result.append(contentsOf: left)
    }
    
    if !right.isEmpty { // 오른쪽 배열의 요소가 남은 경우
        result.append(contentsOf: right)
    }
    
    return result
}

for item in mergeSort(array: array) {
    print(item)
}
