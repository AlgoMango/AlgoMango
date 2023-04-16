//230416_1181단어정렬_백준
// QuickSort 안씀..

let testcase = Int(readLine()!)!

var board: [String] = []

for _ in 0..<testcase {
    board.append(readLine()!)
}

var newBoard = Array(Set(board))  // 중복 제거

newBoard.sort { stringA, stringB in
    if stringA.count < stringB.count {
        return true
    } else if stringA.count == stringB.count {
        return stringA < stringB
    } else {
        return false
    }
}

print(newBoard.joined(separator: "\n"))
