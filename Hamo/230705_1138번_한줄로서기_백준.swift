import Foundation

// 00: 25 ~ 00: 57

let N = Int(readLine()!)!
let memory = readLine()!.split(separator: " ").map { Int($0)! }

var line: [Int] = Array(repeating: 0, count: N)

for (index, number) in memory.enumerated() {
    if index == 0 {
        line[number] = index + 1
        continue
    }
    
    var count = 0
    
    for (lineIndex, num) in line.enumerated() {
        if num == 0 || num > index + 1 {
            count += 1
        }
        
        if num == 0 && count > number {
            line[lineIndex] = index + 1
            count = 0
            break
        }
    }
}

line.forEach {
    print($0, terminator: " ")
}
