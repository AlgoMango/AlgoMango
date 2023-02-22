// 시간초과 나는 이유가 print 때문이었다..
// arr.forEach { print($0) } 쓰지말자....
// arr.map { String($0) }.joined(separator: " ")}
// 하지만 선국이형 코드가 깔끔해서 베낌

let n = Int(readLine()!)!
let numbers: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
var answer: [Int] = Array(repeating: -1, count: n)

var valStack: [Int] = []
var indexStack: [Int] = []

for i in 0..<n {
    while !valStack.isEmpty {
        if numbers[i] > valStack.last! {
            answer[indexStack.last!] = numbers[i]
            valStack.removeLast()
            indexStack.removeLast()
        } else {
            break
        }
    }
    
    valStack.append(numbers[i])
    indexStack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
