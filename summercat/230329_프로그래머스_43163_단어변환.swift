import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answer: Int = 0
    if !words.contains(target) { return 0 }
    var visited = Array(repeating: false, count: words.count)
    
    var queue: [(word: String, count: Int)] = [(begin, 0)]
    var idx: Int = 0
    
    while idx < queue.count {
        let cur = queue[idx]
        if cur.word == target {
            answer = cur.count
            break
        }
        
        for i in 0..<words.count {
            if visited[i] { continue }
            if compare(cur.word, words[i]) {
                queue.append((words[i], cur.count + 1))
                visited[i] = true
            }
        }
        
        idx += 1
    }
    
    
    return answer
}

func compare(_ first: String, _ second: String) -> Bool {
    let f = Array(first)
    let s = Array(second)
    var diff: Int = 0
    
    for i in 0..<f.count {
        if f[i] != s[i] { diff += 1 }
    }
    
    if diff > 1 { return false }
    else { return true }
}
