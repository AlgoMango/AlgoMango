//230430_1026보물_백준

let testcase = Int(readLine()!)!

var arrayA = readLine()!.split(separator: " ").map { Int(String($0))! }
var arrayB = readLine()!.split(separator: " ").map { Int(String($0))! }

arrayA.sort(by: <)
arrayB.sort(by: >)

var answer = 0

for index in 0..<testcase {
    answer += (arrayA[index] * arrayB[index])
}

print(answer)
