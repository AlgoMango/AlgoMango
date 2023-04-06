import Foundation

let count = Int(readLine()!)!
var movies: [[Int]] = []
var results: String = ""

for _ in 1...count {
    let input = readLine()!.map { Int(String($0))! }
    movies.append(input)
}

compress(start: (0, 0), line: count)
print(results)

func compress(start: (x: Int, y: Int), line: Int) {
    let target = movies[start.y][start.x]
    var isCompressed = true
    if line == 1 {
        results += target.description
        return
    }
    
    for y in start.y..<start.y + line {
        if isCompressed {
            for x in start.x..<start.x + line {
                if movies[y][x] != target {
                    isCompressed.toggle()
                    break
                }
            }
        }
    }
    
    if !isCompressed {
        results += "("
        let nextLine = line / 2
        
        compress(start: (start.x, start.y), line: nextLine)
        compress(start: (start.x + nextLine, start.y), line: nextLine)
        compress(start: (start.x, start.y + nextLine), line: nextLine)
        compress(start: (start.x + nextLine, start.y + nextLine), line: nextLine)
        results += ")"
    } else {
        results += target.description
    }
}
