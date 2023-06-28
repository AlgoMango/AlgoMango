import Foundation

// 00 : 56 ~ 개오래걸림 ㅋㅋ

let count = Int(readLine()!)!
var blocks: [(x: Int, y: Int)] = Array(repeating: (0, 0), count: 1001)
var area = 0
var totalMaxHeight = 0
var lastIndex = 0

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    blocks[input[0]] = (input[0], input[1])
    
    if input[1] > totalMaxHeight {
        totalMaxHeight = input[1]
    }
    
    if input[0] > lastIndex {
        lastIndex = input[0]
    }
}

var reversedBlocks: [(x: Int, y: Int)] = blocks[0...lastIndex].reversed()

// 왼쪽
var leftMaxX = 0
var leftMaxHeight = 0

for block in blocks {
    guard block.y != totalMaxHeight else {
        leftMaxX = block.x
        break
    }
    
    if leftMaxHeight < block.y {
        leftMaxHeight = block.y
    }
    
    area += leftMaxHeight
}

// 오른쪽
var rightMaxX = 0
var rightMaxHeight = 0

for block in reversedBlocks {
    guard block.y != totalMaxHeight else {
        rightMaxX = block.x
        break
    }
    
    if rightMaxHeight < block.y {
        rightMaxHeight = block.y
    }
    
    area += rightMaxHeight
}

if leftMaxX == rightMaxX {
    area += totalMaxHeight
} else {
    area += (rightMaxX - leftMaxX + 1) * totalMaxHeight
}

print(area)
