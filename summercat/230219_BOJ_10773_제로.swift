let k = Int(readLine()!)!

var numbers: [Int] = []

func solve() {
    let input = Int(readLine()!)!
    
    if input == 0 {
        numbers.removeLast()
    } else {
        numbers.append(input)
    }
}

for i in 1...k {
    solve()
}

let answer = numbers.reduce(0, +)
print(answer)
