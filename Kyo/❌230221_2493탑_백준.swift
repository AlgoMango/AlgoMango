//230221_2493탑_백준

let testCase = Int(readLine()!)!
let inputNumber = readLine()!.split(separator: " ").map { Int($0)! }
var result: [Int] = []

var stack: [Int] = []

for index in (1...testCase-1).reversed() {
    var cnt = index - 1
    
    while cnt > 0 {
        if inputNumber[cnt] > inputNumber[index] {
            result.append(cnt + 1)
            break
        } else {
            cnt -= 1
        }
    }
    
    if cnt <= 0 {
        result.append(0)
    }
}

result.append(0)
for item in Array(result.reversed()) {
    print(item, terminator: " ")
}
