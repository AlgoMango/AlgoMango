//

func solution() {
    let count = Int(readLine()!)!
    var nodes: [String: (String?, String?)] = [:]
    var result1 = "", result2 = "", result3 = ""
    
    for _ in 1...count {
        let input = readLine()!.split(separator: " ").map({
            String($0) == "." ? nil : String($0)
        })
        nodes[input[0]!] = (input[1], input[2])
    }
    
    func rootLeftRight(_ node: String) { //전위 순회
        result1 += node
        
        if result1.count == count {
            return
        }
        
        if let left = nodes[node]!.0 {
            rootLeftRight(left)
        }
        if let right = nodes[node]!.1 {
            rootLeftRight(right)
        }
    }
    
    func leftRootRight(_ node: String) { //중위 순회
        if result2.count == count {
            return
        }
        
        if let left = nodes[node]!.0 {
            leftRootRight(left)
        }
        
        result2 += node
        
        if let right = nodes[node]!.1 {
            leftRootRight(right)
        }
    }
    
    func leftRightRoot(_ node: String) { //후위 순회
        if result3.count == count {
            return
        }
        
        if let left = nodes[node]!.0 {
            leftRightRoot(left)
        }
        
        if let right = nodes[node]!.1 {
            leftRightRoot(right)
        }
        result3 += node
    }
    
    rootLeftRight("A")
    leftRootRight("A")
    leftRightRoot("A")
    print(result1, result2, result3, separator: "\n")
}

solution()
