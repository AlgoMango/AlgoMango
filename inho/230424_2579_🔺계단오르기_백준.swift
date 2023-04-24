//
/*
 6 -> 6 + max(4에서 오는 방법, 5 + 3에서 오는 방법)
 5 -> 5 + max(4에서 오는 방법, 3 + 2에서 오는 방법)
 ...
 2: 2 + 1
*/

func solution() {
    let count = Int(readLine()!)!
    var array = [0]
    var dp = Array(repeating: 0, count: count+1)
    
    for _ in 0..<count {
        array.append(Int(readLine()!)!)
    }

    for i in 1..<count+1 {
        if i == 1 {
            dp[1] = array[1]
        } else if i == 2 {
            dp[2] = array[1] + array[2]
        } else {
            dp[i] = max(array[i] + array[i-1] + dp[i-3], array[i] + dp[i-2])
        }
    }
    
    print(dp.last!)
}

solution()

/* 처음에 했던 풀이인데 왜 안되는지 도저히 모르겠습니다,,,
let count = Int(readLine()!)!
var steps: [Int] = []
var index = count - 1
var max = 0

for _ in 1...count {
    steps.append(Int(readLine()!)!)
}

while true {
    max += steps[index]
    if index == 1 {
        max += steps[0]
        break
    } else if index == 0 {
        break
    }
    if steps[index-1] > steps[index-2] {
        max += steps[index-1]
        index -= 3
    } else {
        index -= 2
    }
}
*/
