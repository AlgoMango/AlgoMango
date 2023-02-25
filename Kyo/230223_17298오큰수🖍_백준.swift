//230223_17298오큰수_백준

// 왜 시간초과.. > 마지막 입출력을 O(n)으로 받았는데 print자체가 시간이 오래걸린다.



// MARK: - Input, Input 조작
let testCase = Int(readLine()!)!
var inputs = readLine()!.split(separator: " ").map { Int(String($0))! }

inputs = inputs.reversed()

// MARK: - Logic
var result: [Int] = []
var stack: [Int] = [1000001]
// 1000001, 7, 2, 5, 3

for index in 0..<inputs.count {
    while stack.last! <= inputs[index] {
        stack.removeLast()
    }
    
    if stack.last! == 1000001 {
        result.append(-1)
    } else {
        result.append(stack.last!)
    }
    stack.append(inputs[index])
}

// MARK: - Output
print(result.reversed().joined(separator: " "))

// for item in result.reversed() {
//     print(item, terminator: " ")
// }
