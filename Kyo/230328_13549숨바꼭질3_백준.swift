//230328_13549숨바꼭질3_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let subin = input[0]
let bro = input[1]
let maxNum = 100001

var visit = Array(repeating: 0, count: maxNum)  // 여기에 dist 담을 것

var queue: [Int] = [subin]
visit[subin] = 1

// BFS
var index = 0
while index < queue.count {
    let cur = queue[index]
    index += 1
    
    let dy = [cur * 2, cur - 1, cur + 1]    // *2 부터 순회해야 +1 처리 안하고 최단 경로 찾을 수 있다.
    for dir in 0..<dy.count {
        let ny = dy[dir]
        
        if ny < 0 || ny >= maxNum { continue }
        if visit[ny] != 0 { continue }
        
        queue.append(ny)
        if ny == cur * 2 {
            visit[ny] = visit[cur]
        } else {
            visit[ny] = visit[cur] + 1
        }
        
        if ny == bro { break }
    }
}

print(visit[bro] - 1)
