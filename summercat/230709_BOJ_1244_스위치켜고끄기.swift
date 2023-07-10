// 20분

let size = Int(readLine()!)!
// 0번부터 size번까지의 스위치 존재 (0번은 사용 x)
var switches: [Int] = [0]
switches.append(contentsOf: readLine()!.split(separator: " ").compactMap { Int(String($0)) })
let students = Int(readLine()!)!

func solve() {
    let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    if line[0] == 1 {
        male(line[1])
    } else {
        female(line[1])
    }
}

func male(_ num: Int) {
    var multiplier: Int = 1
    
    while true {
        let currentIndex: Int = num * multiplier
        if currentIndex > size { break }
        toggle(currentIndex)
        multiplier += 1
    }
}

func female(_ num: Int) {
    var dist: Int = 1
    toggle(num)
    
    while true {
        let left = num - dist
        let right = num + dist
        if left < 1 || right > size { break }
        if switches[left] != switches[right] { break }
        toggle(left)
        toggle(right)
        dist += 1
    }
}

func toggle(_ cur: Int) {
    if switches[cur] == 0 { switches[cur] = 1 }
    else { switches[cur] = 0 }
}

for _ in 0..<students {
    solve()
}

let answer = Array(switches[1...])
for i in 0..<answer.count {
    if i != 0, i % 20 == 0 { print() }
    print(answer[i], terminator: " ")
}
