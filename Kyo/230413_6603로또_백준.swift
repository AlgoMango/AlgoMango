//230413_6603로또_백준

while true {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if input.first! == 0 { break }
    
    let k = input.first!
    var answer = ""
    
    input.removeFirst()
    let board = input
    
    var array: [String] = Array(repeating: " ", count: 6)
    var visit: [Bool] = Array(repeating: false, count: k)
    
    recursive(number: 0, start: 0)
    // Output
    print(answer)
    
    // Recursive Function
    func recursive(number: Int, start: Int) {
        if number == 6 {
            answer += array.joined(separator: " ")
            answer += "\n"
            return
        }
        
        for index in start..<board.count {
            if visit[index] { continue }
            
            visit[index] = true
            array[number] = String(board[index])
            recursive(number: number + 1, start: index)
            visit[index] = false
        }
    }
}
