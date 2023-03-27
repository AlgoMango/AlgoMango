//230327_단어변환_프로그래머스

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) { return 0 } // 만약 타겟 단어가 없는 경우 
    
    var queue: [(String, Int)] = []
    var visit: [Bool] = Array(repeating: false, count: words.count)
    
    queue.append((begin, 0))    // 시작점
    
    var answer = 0
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        if cur.0 == target { 
            answer =  cur.1
        }
        
        for index in 0..<words.count {
            if checkWord(cur.0, words[index]) && !visit[index] { // 방문한적없고, 단어 차이 1개면
                queue.append((words[index], cur.1 + 1))         // cnt 추가해서 append
                visit[index] = true
            }
        }
    }
    
    return answer
}

func checkWord(_ A: String, _ B: String) -> Bool {
    let tempA = A.map { String($0) }
    let tempB = B.map { String($0) }
    
    var cnt = 0 
    for index in 0..<tempA.count {
        if cnt > 1 { return false }     // 1개 이상 차이나면 바로 false 리턴
        if tempA[index] != tempB[index] {
            cnt += 1
        }
    }
    
    return cnt == 1 ? true : false
}
