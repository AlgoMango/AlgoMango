//https://www.acmicpc.net/problem/9095

func solution() {
    let count = Int(readLine()!)!
    var numbers = [Int]()
    
    for _ in 1...count {
        numbers.append(Int(readLine()!)!)
    }
    
    func dp(_ i: Int) -> Int {
        if i == 1 { return 1 }
        if i == 2 { return 2 }
        if i == 3 { return 4 }
        
        return dp(i-1) + dp(i-2) + dp(i-3)
    }
    
    numbers.forEach({ print(dp($0)) })
}

solution()
