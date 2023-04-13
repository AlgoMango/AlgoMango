import Foundation

let temp = readLine()!.split(separator: " ").map { Int($0)! }
let sequence = readLine()!.split(separator: " ").map { Int($0)! }
let count = temp[0]
let sum = temp[1]

var result: Int = 0

func backTracking(depth: Int, current: Int) {
    if depth == count {
        return
    }
    
    for index in sequence.indices {
        if index > depth {
            backTracking(depth: index, current: current + sequence[index])
        }
    }
    
    if current == sum {
        result += 1
    }
}

for index in sequence.indices {
    backTracking(depth: index, current: sequence[index])
}


print(result)
