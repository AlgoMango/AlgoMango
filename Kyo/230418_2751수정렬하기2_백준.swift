//230418_2751수정렬하기2_백준
/*
 MergeSort : O(nlogn)
QuickSort : O(nlogn) ~ O(n^2)
*/


let testCase = Int(readLine()!)!

var array: [Int] = []

for _ in 0..<testCase {
    array.append(Int(readLine()!)!)
}

// Output
for item in mergeSort(array: array) {
    print(item)
}



// 반띵씩 나누는 것
func mergeSort(array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    
    let center = array.count / 2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    return merge(left: mergeSort(array: left), right: mergeSort(array: right))
}

// 합치기
func merge(left: [Int], right: [Int]) -> [Int] {
    var left = left
    var right = right
    
    var newArray: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] > right[rightIndex] {
            newArray.append(right[rightIndex])
            rightIndex += 1
        } else {
            newArray.append(left[leftIndex])
            leftIndex += 1
        }
    }
    
    if leftIndex < left.count { // left 남았을 때
        newArray.append(contentsOf: left[leftIndex..<left.count])
    }
    
    if rightIndex < right.count { // right 남았을 때
        newArray.append(contentsOf: right[rightIndex..<right.count])
    }
    
    
    return newArray
}
