//230304_2606바이러스_백준

// 컴퓨터 수
let computer = Int(readLine()!)!

// 연결 수
let link = Int(readLine()!)!

var network = Array(repeating: Array(repeating: 0, count: computer + 1), count: computer + 1)
var visit = Array(repeating: false, count: computer + 1) // 방문 Check

for _ in 0..<link {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    network[input[0]][input[1]] = 1
    network[input[1]][input[0]] = 1
}

var queue: [Int] = [1]
visit[1] = true // true면 방문했다는 의미

var answer = 0

while !queue.isEmpty {
    let cur = queue.removeFirst()

    for index in 1..<computer + 1 {
        if visit[index] { continue }
        if network[cur][index] == 0 { continue }
        queue.append(index)
        answer += 1
        visit[index] = true
    }
}

print(answer)
