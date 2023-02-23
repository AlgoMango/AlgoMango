//https://www.acmicpc.net/problem/2493

func solution() {
    let count = Int(readLine()!)!
    let towers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var stack: [Int] = []
    var result = Array(repeating: 0, count: count)
    
    for i in 0..<count {
        let index = count - 1 - i //탑 배열의 뒤에서부터 확인
        
        while !stack.isEmpty, towers[index] > towers[stack.last!] {
            let towerIndex = stack.removeLast()
            result[towerIndex] += index + 1
        }
        stack.append(index)
    }

    print(result.map { String($0) }.joined(separator: " "))
}

solution()
// 진짜 한대 치고싶네요,,
