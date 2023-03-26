//https://school.programmers.co.kr/learn/courses/30/lessons/43163

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var visited = Array(repeating: false, count: words.count)
    var result = 0
    
    func bfs() { //조건에 충족하는 단어들을 대상으로 도는 bfs
        var stack = [(begin, 0)]
        var index = 0
        
        while !stack.isEmpty {
            let node = stack[index]
            
            guard node.0 != target else {
                result = node.1
                return
            }
            
            let nextWords = words.filter { compare(a: Array($0), b: Array(node.0)) == $0.count - 1 } //1개의 문자만 다른 단어들
                                       //{ Set(node.0).substract(Set($0)).count == 1 }로 시도했었는데, Set(dod) == Set(do)로 돼서 틀렸던거같은 풀이
            index += 1
            
            for word in nextWords {
                let i = words.firstIndex(of: word)!
                
                if !visited[i] {
                    stack.append((word, node.1 + 1))
                    visited[i] = true
                }
            }
        }
    }
    
    func compare(a: [Character], b: [Character]) -> Int { //같은 문자의 갯수를 확인하는 함수
        var result = 0
        
        for i in 0..<a.count {
            if a[i] == b[i] {
                result += 1
            }
        }
        
        return result
    }

    bfs()
    
    return result
}
