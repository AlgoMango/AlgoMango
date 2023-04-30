//

func solution() {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let count = input[0]
    var target = input[1]
    var coins: [Int] = []
    var result = 0, index = count-1
    
    for _ in 1...count {
        coins.append(Int(readLine()!)!)
    }
    
    while true {
        if target == 0 { return print(result) }
        
        let coin = coins[index]
        
        if coin <= target { //높은 동전부터 지불하면서 내려오는 방식
            target -= coin
            result += 1
        } else {
            index -= 1
        }
    }
}

solution()
