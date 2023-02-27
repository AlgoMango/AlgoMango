import Foundation

class Solution {
    func simplifyPath(_ path: String) -> String {
        var array: [String] = path.trimmingCharacters(in: ["/"]).components(separatedBy: "/").reversed()
        var results: [String] = []
        
        while !array.isEmpty {
            print(array)
            let last = array.removeLast()
            
            if last == "." {
                continue
            } else if last == "/" {
                continue
            } else if last == "" {
                continue
            } else if last == ".." {
                results.popLast()
            } else {
                results.append(last)
            }
            
        }
        
        return "/" + results.joined(separator: "/")
    }
}
