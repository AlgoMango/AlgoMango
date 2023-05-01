//230501_1931회의실배정_백준

let testcase = Int(readLine()!)!

var array: [[Int]] = []

for _ in 0..<testcase {
    array.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 그냥 빨리 끝나는 회의 싹 찾으면 된다.
array.sort { first, second in
    if first[1] < second[1] {
        return true
    } else if first[1] == second[1] {
        return first[0] < second[0]
    } else {
        return false
    }
}


var start = 0
var end = 0
var answer = 0

for index in 0..<array.count {
    if end <= array[index][0] {
        end = array[index][1]
        answer += 1
    }
}

print(answer)
