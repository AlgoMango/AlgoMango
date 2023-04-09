import Foundation

func star(line: Int, pattern: [String]) {
    if line == 1 {
        pattern.forEach {
            print($0)
        }
        return
    }
    
    let top = pattern.map { $0 + $0 + $0 }
    let middle = pattern.map { $0 + String(repeating: " ", count: $0.count) + $0}
    let bottom = pattern.map { $0 + $0 + $0 }

    star(line: line / 3, pattern: top + middle + bottom)
}

star(line: 9, pattern: ["*"])

// 미친 풀이,,,
