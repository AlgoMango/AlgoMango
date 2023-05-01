//https://www.acmicpc.net/problem/1931
// 빨리 끝나는 회의를 선택하면 최대 갯수를 구할 수 있음

func solution() {
    let count = Int(readLine()!)!
    var times: [(start: Int, end: Int)] = []
    var endTime = 0
    var index = 0
    var result = 0
    
    for _ in 1...count {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        times.append((start: input[0], end: input[1]))
    }
    //끝나는 시간이 빠른 순으로 정렬, 같다면 시작 시간이 빠른 순
    times = times.sorted(by: { $0.end == $1.end ? $0.start < $1.start : $0.end < $1.end })
  
    while true {
        if index == count { return print(result) }
        
        let time = times[index]
        
        if time.start >= endTime {
            result += 1
            endTime = time.end
        }
        index += 1
    }
}

solution()
