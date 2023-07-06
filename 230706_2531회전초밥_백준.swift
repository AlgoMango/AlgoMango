let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var num = input[0]          // 접시 수
var category = input[1]     // 초밥 가지 수
var relay = input[2]        // 연속해서 먹는 접시 수
var coupon = input[3]       // 쿠폰 번호

var board: [Int] = []

// Input
for _ in 0..<num {
    board.append(Int(readLine()!)!)
}
// 왜 아래 코드는 안되나? 
// for index in 0..<relay - 1 {
//     board.append(board[index])
// }

for index in 0..<relay {
    board.append(board[index])
}

var dict: [Int:Int] = [coupon: 1]

var startIndex = 0
var maxNumber = -1
for index in 0..<board.count {
    let number = board[index]       // 현재 음식 종류
    var temp = board[startIndex]
    
    if index < relay {
        dict[number] = (dict[number] ?? 0) + 1
    } else {
        maxNumber = max(maxNumber, dict.count)
        
        if dict[temp] == 1 {
            dict[temp] = nil
        } else {
            dict[temp]! -= 1
        }
        
        dict[number] = (dict[number] ?? 0) + 1
        startIndex += 1
        temp = board[startIndex]
    }
}

print(maxNumber)
