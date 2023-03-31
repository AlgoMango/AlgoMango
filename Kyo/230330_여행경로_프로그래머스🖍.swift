//230330_여행경로_프로그래머스
/*
 답이 안나오면 되돌아가는 코드를 설계를 잘못했다..
 재귀연습이 필요할듯..
 아래는 정상동작하는 코드 / 다시 풀어야함
*/

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    var tempTickets = tickets.sorted { tempA, tempB in
        if tempA[0] < tempB[0] {
            return true
        } else if tempA[0] == tempB[0] {
            return tempA[1] < tempB[1]
        } else {
            return false
        }
    }
    
    var visit: [Bool] = Array(repeating: false, count: tickets.count)
    
    var result: [String] = []
    
    func dfs(start: String) {
        // 현재 방문한 도시 수가 티켓 수와 같다면 지금 도착한 곳이 마지막 여행지
        if result.count == tempTickets.count {
            result.append(start)
            return
        }
        for index in 0..<tempTickets.count {
            if tempTickets[index][0] == start && visit[index] == false {
                visit[index] = true
                result.append(start)
                dfs(start: tempTickets[index][1])
                // 정답을 이미 구했다면 return
                if result.count == tempTickets.count + 1 {
                    return
                }
                // 만약 끝까지 갓는데도 return이 안됫다면 하나씩 제거하면서 돌아가는 코드 
                result.removeLast()
                visit[index] = false
            }
        }
    }
    
    dfs(start: "ICN")
    
    return result
}
