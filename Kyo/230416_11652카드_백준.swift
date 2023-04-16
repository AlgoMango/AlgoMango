//230416_11652카드_백준

let testcase = Int(readLine()!)!

var dict: [Int : Int] = [:]

for _ in 0..<testcase {
    let number = Int(readLine()!)!
    
    if dict[number] == nil {
        dict[number] = 1
    } else {
        dict[number]! += 1
    }
}

var board: [(Int, Int)] = []

for item in dict {
    board.append((item.key, item.value))
}

board.sort { itemA, itemB in
    if itemA.1 > itemB.1 {
        return true
    } else if itemA.1 == itemB.1 {
        return itemA.0 < itemB.0
    } else {
        return false
    }
}

print(board.first!.0)
