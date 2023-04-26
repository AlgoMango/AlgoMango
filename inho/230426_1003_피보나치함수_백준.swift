//https://www.acmicpc.net/problem/1003

/* 피보나치 함수 호출했더니 시간초과
func fibonacci(_ i: Int) {
    if i == 0 {
        result.0 += 1
        return
    } else if i == 1 {
        result.1 += 1
        return
    }

    fibonacci(i-1)
    fibonacci(i-2)
}
*/

func solution() {
    let count = Int(readLine()!)!
    var fibonacci: [(Int, Int)] = Array(repeating: (0, 0), count: 41)
    fibonacci[0] = (1, 0)
    fibonacci[1] = (0, 1)
    
    for index in 2..<41 { //시작할때 40이하의 피보나치값을 일단 모두 
        fibonacci[index] = (fibonacci[index-1].0 + fibonacci[index-2].0, fibonacci[index-1].1 + fibonacci[index-2].1)
    }
    
    for _ in 1...count {
        let index = Int(readLine()!)!
        print(fibonacci[index].0, fibonacci[index].1)
    }
}

solution()

/*
 2 -> 1, 1
 3 -> 1, 2
 4 -> 2, 3
 */
