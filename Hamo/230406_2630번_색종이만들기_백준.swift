import Foundation

let line = Int(readLine()!)!
var papers: [[Int]] = []
var results: [Int] = [0, 0]

for _ in 1...line {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    papers.append(input)
}

findPaper(start: (0, 0), line: line)
results.forEach {
    print($0)
}

func findPaper(start: (Int, Int), line: Int) {
    let target = papers[start.0][start.1]
    var isPaper = true
    if line == 1 {
        results[target] += 1
        return
    }
    
    
    for i in start.0..<start.0 + line {
        if isPaper {
            for j in start.1..<start.1 + line {
                if papers[i][j] != target {
                    isPaper.toggle()
                    break
                }
            }
        }
    }
    
    if !isPaper {
        let nextLine = line / 2
        
        findPaper(start: (start.0, start.1), line: nextLine)
        findPaper(start: (start.0 + nextLine, start.1), line: nextLine)
        findPaper(start: (start.0, start.1 + nextLine), line: nextLine)
        findPaper(start: (start.0 + nextLine, start.1 + nextLine), line: nextLine)
    } else {
        results[target] += 1
    }
}
