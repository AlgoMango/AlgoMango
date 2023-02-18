//230218_10733제로_백준

let cnt = Int(readLine()!)!

var stack: [Int] = []

for _ in 0..<cnt {
    let input = Int(readLine()!)!
    if input == 0 {
        stack.removeLast()
        continue
    }
    stack.append(input)
}

var result = 0

for num in stack {
    result += num
}

print(result)
