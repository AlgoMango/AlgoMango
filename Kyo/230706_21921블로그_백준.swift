//2:50 - 3:20
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var relayDay = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxNumber = -1
var sum = 0
var temp = board[0]
var startIndex = 0
var count = 1

for index in 0..<board.count {
    if index < relayDay {
        sum += board[index]
        maxNumber = sum
        continue
    }
    sum -= temp
    sum += board[index]
    
    startIndex += 1
    temp = board[startIndex]
    
    if maxNumber < sum {
        maxNumber = sum
        count = 1
    } else if maxNumber == sum {
        count += 1
    }
}

if maxNumber == 0 {
    print("SAD")
} else {
    print(maxNumber)
    print(count)
}
