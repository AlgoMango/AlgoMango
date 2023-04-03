//230330_여행경로_프로그래머스
/*
 답이 안나오면 되돌아가는 코드를 설계를 잘못했다..
 재귀연습이 필요할듯..
 아래는 정상동작하는 코드 / 다시 풀어야함
*/

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    // 가능한 경로가 2개 이상일 경우에 알파벳 순서가 앞서는 경로를 Return하기위해 Sorting
    var sortTickets = tickets.sorted {
        return $0[1] < $1[1]
    }
    
    var answer: [String] = ["ICN"]
    var visit: [Bool] = Array(repeating: false, count: tickets.count)
    
    func dfs(start: String) {
        // answer Count 만족하면 Return
        if answer.count == tickets.count + 1 { return }
        
        for index in 0..<sortTickets.count {
            let location = sortTickets[index][1]  // 도착지
            
            if start == sortTickets[index][0] && visit[index] == false {
                visit[index] = true
                answer.append(location)
                dfs(start: location) // 재귀
                if answer.count == sortTickets.count + 1 { return } // answer Count 만족하면 Return
                // 만족 못해서 Return이 안된 것이니 뒤로 false 및 remove 처리
                visit[index] = false 
                answer.removeLast()
            }
        }
    }
    
    dfs(start: "ICN")
    return answer
}
