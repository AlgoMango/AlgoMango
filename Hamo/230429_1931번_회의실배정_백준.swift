import Foundation

let count = Int(readLine()!)!

var meeting: [(start: Int, end: Int)] = []
var result = 0
var time = 0

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    meeting.append((input[0], input[1]))
}

meeting = meeting.sorted { first, second in
    if first.end == second.end {
        return first.start < second.start
    } else {
        return first.end < second.end
    }
}

for i in 0..<count {
    if time > meeting[i].start {
        continue
    }
    
    result += 1
    time = meeting[i].end
}

print(result)
