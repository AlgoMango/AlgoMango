//230316_1697숨바꼭질_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let start = input[0]
let end = input[1]

// 최대 범위를 100,001로 지정해야한다. 
// 동생위치로 하면 안된다. 동생위치보다 수빈이가 더 뒤에있을 수도 있다.
let maxLocation = 100001

var dist = Array(repeating: -1, count: maxLocation)

var queue: [Int] = []
queue.append(start)
dist[start] = 0

while !queue.isEmpty {
    let cur = queue.removeFirst()
    if cur == end { break }
    
    for nx in [cur - 1, cur + 1, cur * 2] {
        if nx < 0 || nx >= maxLocation { continue } // > 로 해서 시간날림..
        if dist[nx] != -1 { continue }
        dist[nx] = dist[cur] + 1
        queue.append(nx)
    }
}

print(dist[end])
