import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visits: [Int] = Array(repeating: 0, count: words.count)
    var needVisitQueue: [(String, Int)] = [(begin, 0)]
    var index = 0
    var result = 0
    
    while index < needVisitQueue.count {
        let currentNode = needVisitQueue[index]
        index += 1
        
        if currentNode.0 == target {
            result = currentNode.1
            break
        }

        for (str, index) in zip(words, words.indices) {
            if canChange(text1: currentNode.0, text2: str) && visits[index] == 0 {
                visits[index] = 1
                needVisitQueue.append((str, currentNode.1 + 1))
            }
        }
    }

    return result
}

func canChange(text1: String, text2: String) -> Bool {
    var diff = 0

    for (char1, char2) in zip(text1, text2) {
        if char1 != char2 {
            diff += 1
        }
    }

    return diff == 1 ? true : false
}
