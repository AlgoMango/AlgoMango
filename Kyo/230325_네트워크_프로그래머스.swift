//230325_네트워크_프로그래머스

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visit = Array(repeating: 0, count: n) // 방문 배열
    
    var queue: [Int] = []
    
    var cnt = 0
    for index in 0..<computers.count {
        if visit[index] != 0 { continue }
        queue.append(index)
        cnt += 1
        visit[index] = cnt
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for net in 0..<computers[cur].count {
                if visit[net] != 0 || computers[cur][net] == 0 { continue } // 이미 방문했거나 안이어져있을 경우

                queue.append(net)            // 이어져있으면 queue에 append
                visit[net] = visit[index]    // 이어져있으면 visit에 check
            }    
        }
    }
    return cnt
}
