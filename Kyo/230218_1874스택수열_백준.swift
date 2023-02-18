//230218_1874스택수열_백준
// No가 아니라.. NO였다..문제 잘 읽자..

let testCase = Int(readLine()!)!

var stack: [Int] = []
var result: [String] = []
var flag = true
var recent = 1

for _ in 0..<testCase {
    let input = Int(readLine()!)!
    
    while recent <= input {
        stack.append(recent)
        result.append("+")
        recent += 1
    }
    
    if stack.last! > input {
        flag = false
        break
    }
    
    stack.removeLast()
    result.append("-")
}

if !flag {
    print("NO")
} else {
    for item in result {
        print(item)
    }
}
