//230510_2493탑_2회차_백준

let testcase = Int(readLine()!)!

var answer: [Int] = []
var array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

let maxNumber = 100000001

var stack: [(Int, Int)] = [(maxNumber, 0)]

array = array.reversed()
// 4 7 5 9 6
for index in (0..<testcase).reversed() {
    
    while array[index] >= stack.last!.0 {
        stack.removeLast()
    }
    
    answer.append(stack.last!.0 == maxNumber ? 0 : stack.last!.1)
    stack.append((array[index], testcase - index))
}

print(answer.map { String($0) }.joined(separator: " "))
