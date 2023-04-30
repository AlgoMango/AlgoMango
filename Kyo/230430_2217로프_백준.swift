//230430_2217로프_백준

let testcase = Int(readLine()!)!

var array: [Int] = []

for _ in 0..<testcase {
    array.append(Int(readLine()!)!)
}

var maxWeight = 0
array.sort(by: <)       // 정렬

for index in 0..<array.count {
    let temp = array[index] * (testcase - index)
    
    maxWeight = max(maxWeight, temp)
}

print(maxWeight)
