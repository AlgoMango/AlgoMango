import Foundation

let count = Int(readLine()!)!
var stack: [String] = []
var results: [String] = []

for _ in 1...count {
    var PS = readLine()!
    
    while !PS.isEmpty {
        guard let top = PS.popLast() else {
            break
        }
        
        if stack.isEmpty {
            stack.append(String(top))
        } else if String(top) + stack.last! == "()" {
            stack.popLast()
        } else {
            stack.append(String(top))
        }
    }
    
    if stack.isEmpty {
        results.append("YES")
    } else {
        results.append("NO")
    }
    
    stack.removeAll()
}

results.forEach {
    print($0)
}
