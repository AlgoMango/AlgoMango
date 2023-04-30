//230430_11399ATM_백준

let testcase = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int(String($0))! }

array.sort(by: <)

var answer = 0
var temp = 0

for index in 0..<testcase {
    answer += (array[index] + temp)
    temp += array[index]
}

print(answer)
