// https://school.programmers.co.kr/learn/courses/30/lessons/43162

//풀이 dfs

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: computers.count)
    var answer: Int = 0

    for (x, network) in computers.enumerated() {     // x 탐색
        guard !visited[x] else { continue }

        var stack: [Int] = [x]
        visited[x] = true
        answer += 1

        while !stack.isEmpty {                        // x와 연결된 컴퓨터들을
            let x2 = stack.removeLast()
            let x2Network = computers[x2]
            var y = x + 1                             // x보다 큰 값부터 탐색, 번호가 작은 컴퓨터와의 연결은 이미 앞에서 체크함

            while y < network.count {                 // y 탐색:  x와 연결된 컴퓨터들을 stack에 담으면서 visited처리
                guard x2Network[y] == 1,
                      visited[y] == false else {
                    y += 1
                    continue
                }

                stack.append(y)
                visited[y] = true
                y += 1
            }
        }
    }

    return answer
}
