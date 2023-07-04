//230704_10431줄세우기_백준
// 메모리 초과.. 조합구하는 재귀 때문인듯..

var num = Int(readLine()!)!

// index는 키 / 값은 왼쪽에 키큰사람 몇명있는지에 대한 값
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

// 모든 순서를 구한다.
var allCase: [[Int]] = []
var visit: [Bool] = Array(repeating: false, count: num)

foundAllcase(temp: [])

var answer: [Int] = []

for seq in allCase {
    var temp: [Int] = Array(repeating: -1, count: num)
    
    for index in (0..<seq.count).reversed() {
        var count = 0
        for nextIndex in 0..<index {
            if seq[index] < seq[nextIndex] {
                count += 1
            }
        }
        
        temp[seq[index]] = count
        if temp[seq[index]] != numbers[seq[index]] {
            break
        }
    }
    
    if temp == numbers {
        answer = seq
        break
    }
}

answer.forEach { print($0 + 1, terminator: " ") }

func foundAllcase(temp: [Int]) {
    if temp.count == num {
        allCase.append(temp)
        return
    }
    
    for index in 0..<numbers.count {
        if visit[index] { continue }
        
        visit[index] = true
        foundAllcase(temp: temp + [index])
        visit[index] = false
    }
}
