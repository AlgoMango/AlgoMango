//230406_별찍기10_백준

/*
 어떻게 이렇게 풀까..
 두고두고 봐야할듯
 */

let line = Int(readLine()!)!

recursion(line: line, pattern: ["*"])

func recursion(line: Int, pattern: [String]) {
    if line == 1 {
        pattern.forEach({ print($0) })
        return
    }
    
    let top = pattern.map { $0 + $0 + $0 }
    let middle = pattern.map { $0 + String(repeating: " ", count: $0.count) + $0 }
    let bottom = pattern.map { $0 + $0 + $0 }
    
    recursion(line: line/3, pattern: top + middle + bottom)
}
