import Foundation

// https://www.acmicpc.net/problem/10989
// mergeSort, QuickSort 사용시 메모리초과
// ✅ countingSort 사용하면서 출력 여러번 해야하는걸 String 정리하면서 "/n" 을 함께 저장해서 출력해줘야 통과 (fileIO쓰면 1376ms, 안쓰면 4668ms)

let n: Int = Int(readLine()!)!
var countingNums: [Int] = Array(repeating: 0, count: 10001)

for _ in 0..<n {
    let number: Int = Int(readLine()!)!
    countingNums[number] += 1
}

var answer: String = "" // ✅ 출력을 array로 정리하고 한 elem마다 출력하면 시간초과 -> String으로 정리하면서 "/n"같이 저장

for i in 1...10000 {
    answer += String(repeating: "\(i)\n", count: countingNums[i])
}

print(answer)
