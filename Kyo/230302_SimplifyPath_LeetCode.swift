//230302_SimplifyPath_LeetCode

class Solution {
    func simplifyPath(_ path: String) -> String {
        var paths = path.split(separator: "/").map { String($0) }
        var result: [String] = []

        for p in paths {
            result.append("/")
            switch p {
                case ".":
                    result.removeLast()     // 위에서 추가한 "/" 제거
                    continue
                case "..":
                    result.removeLast()     // 위에서 추가한 "/" 제거
                    if result.count >= 2 {  
                        result.removeLast()  // "/" 전의 문자 제거
                        result.removeLast()  // 문자 전의 "/" 제거
                        continue
                    }
                default:
                    result.append(p)
            }
        }

        return result.isEmpty ? "/" : result.joined()
    }
}
