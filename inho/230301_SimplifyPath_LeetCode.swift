class Solution {
    func simplifyPath(_ path: String) -> String {
        let inputs = path.components(separatedBy: "/").filter { $0 != "/" }
        var stack: [String] = []
        
        for input in inputs {
            if !input.isEmpty {
                if input == ".." {
                    stack.popLast()
                } else if input == "." {
                    continue
                } else {
                    stack.append("/\(input)")
                }
            }
        }
        
        if stack.isEmpty {
            stack.append("/")
        }
        
        return stack.joined()
    }
}
