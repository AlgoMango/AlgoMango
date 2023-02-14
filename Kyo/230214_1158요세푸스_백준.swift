//230214_1158요세푸스_백준

let input = readLine()!.split(separator: " ").map { Int($0)! }

let total = input[0]
let removeCnt = input[1]

var left: [Int] = []
var right: [Int] = []

for i in 1..<total+1 {
    right.append(i)
}

right = right.reversed()

var num = 1
var result: [Int] = []
while !left.isEmpty || !right.isEmpty {
    if right.isEmpty {
        right = left.reversed()
        left = []
    }
    if num == removeCnt {
        result.append(right.removeLast())
        num = 1
    } else {
        left.append(right.removeLast())
        num += 1
    }
}

// 출력
print("<", terminator: "")
for index in 0..<result.count {
    if index == result.count - 1 {
        print(result[index], terminator: "")
    } else {
        print(result[index], terminator: ", ")
    }
}
print(">", terminator: "")
