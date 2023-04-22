//https://www.acmicpc.net/problem/1463

func solution() {
    let input = Int(readLine()!)!
    var array = Array(repeating: 0, count: input + 1)
    
    guard input != 1 else { return print(0) }
    
    for i in 2...input {
        array[i] = array[i-1] + 1
        
        if i % 3 == 0 {
            array[i] = min(array[i], array[i/3] + 1)
        }
        if i % 2 == 0 {
            array[i] = min(array[i], array[i/2] + 1)
        }
    }
    
    print(array.last!)
}

solution()
