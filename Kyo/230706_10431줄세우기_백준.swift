//11:57 - 12:40
let testcase = Int(readLine()!)!

var answer: [[Int]] = []

for _ in 0..<testcase {
    var temp: [Int] = []
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    temp.append(input[0])
    
    let numbers = Array(input[1..<input.count])
    
    var count = 0
    var stack: [Int] = [numbers[0]]
    for index in 1..<numbers.count {
        if stack.last! < numbers[index] {
            stack.append(numbers[index])
            continue
        }
        
        for stackIndex in 0..<stack.count {
            if stack[stackIndex] > numbers[index] {
                stack.insert(numbers[index], at: stackIndex)
                count += (stack.count - stackIndex - 1)
                break
            }
        }
    }
    
    temp.append(count)
    answer.append(temp)
}

answer.forEach { datas in
    print("\(datas[0]) \(datas[1])")
}
