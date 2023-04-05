//https://www.acmicpc.net/problem/1629
//나머지를 이용한 수학문제,,

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = input[0], b = input[1], c = input[2]
    
    func recursive(i: Int) -> Int {
        guard i != 0 else { return 1 }
        
        if i % 2 == 0 {
            let result = recursive(i: i / 2)
            
            return result % c * result % c
        } else {
            let result = recursive(i: (i-1) / 2)
            
            return result % c * result % c * a % c
        }
    }
    
    print(recursive(i: b))
}

solution()
