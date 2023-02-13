//230213_1406에디터_백준
var sentence = readLine()!.map { String($0) }
var cnt = Int(readLine()!)!

// 시간초과
/*
var cursor = sentence.count
 for _ in 0..<cnt {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let command = input[0]
    var word: String = ""
    if input.count > 1 {
        word = input[1]
    }
    switch command {
    case "L":
        if cursor > 0 {
            cursor -= 1
        }
    case "D":
        if cursor < sentence.count {
            cursor += 1
        }
    case "B":
        if cursor > 0 {
            sentence.remove(at: cursor-1)  // 여기서 n이라서 시간초과?
            cursor -= 1
        }
    case "P":
        sentence.insert(word, at: cursor)  // 여기서 n이라서 시간초과?
        cursor += 1
    default:
        break
    }
}
 */


// [leftSentence]Cursor[rightSentence] 로 생각
var leftSentence: [String] = sentence
var rightSentence: [String] = []

for _ in 0..<cnt {
    let input = readLine()!
    
    switch input {
    case "L":
        if leftSentence.count != 0 {
            rightSentence.append(leftSentence.removeLast())
        }
    case "D":
        if rightSentence.count != 0 {
            leftSentence.append(rightSentence.removeLast())
        }
    case "B":
        if leftSentence.count != 0 {
            leftSentence.removeLast()
        }
    default:
        leftSentence.append(String(input.last!))
    }
}

print(leftSentence.joined() + rightSentence.reversed().joined())


// 왜 시간초과가 날까..
// let input = readLine()!.split(separator: " ").map { String($0) } 
// split은 O(n)이기 때문에 시간초과난다.
