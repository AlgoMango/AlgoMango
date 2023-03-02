class Solution {
    func simplifyPath(_ path: String) -> String {
        var characters = Array(path)
        var paths: [String] = ["/"]
        var cur: String = ""
        // /를 기준으로 한 path가 끝났는지 확인함
        // cur == "." 이면 continue
        // cur == ".." 이면 answer.removeLast()

        for char in characters {
            if char == "/" {
                if cur == "" { continue }
                if cur == "." { 
                    cur = ""
                    continue
                }
                if cur == ".." {
                    if paths.count > 1 {
                        paths.removeLast()
                    }
                    cur = ""
                    continue
                }
                cur.append("/")
                paths.append(cur)
                cur = ""
                continue
            }
            cur.append(char)
        }

        if cur == ".." {
            if paths.count > 1 { paths.removeLast() }
        } else if cur == "." { cur = "" }
        else { paths.append(cur) }

        var answer = paths.joined()
        if answer.last! == "/" && answer.count > 1 { answer.removeLast() }

        return answer
    }
}
