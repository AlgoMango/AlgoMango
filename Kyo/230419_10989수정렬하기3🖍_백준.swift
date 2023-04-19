//230419_10989수정렬하기3_백준
/*
  선국풀이 참고..
*/

let testcase = Int(readLine()!)!
var countingNums: [Int] = Array(repeating: 0, count: 10001)

for _ in 0..<testcase { // 입력 횟수
    
    let number: Int = Int(readLine()!)!
    countingNums[number] += 1
}

var answer: String = ""
for i in 1...10000 {
    answer += String(repeating: "\(i)\n", count: countingNums[i])
}

print(answer)
