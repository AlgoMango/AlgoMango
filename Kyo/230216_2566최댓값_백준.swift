//230216_2566최댓값_백준

var board: [[Int]] = []
var maxNum = 0
var location: (Int, Int) = (1, 1)

for count in 0..<9 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
  
    if maxNum < input.max()! {
        maxNum = max(maxNum, input.max()!)
        location.0 = count + 1      
        for index in 0..<input.count {
            if input[index] == maxNum {
                location.1 = index + 1
            }
        }
    }
}

print(maxNum)
print(location.0, location.1)
