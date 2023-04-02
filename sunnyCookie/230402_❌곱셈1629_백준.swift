// https://www.acmicpc.net/problem/1629

/*
문제이해
x를 n번 곱해서 d로 나눈 나머지 구하기
제한 0.5초!

풀이

B는 최대 21억이라 21번 연산을 0.5초안에 어떻게 구할 수 있는지 찾는게 중점
A * B % C =  A % C * B % C 를 이용한다.
 ex) 지수가 짝수일 때: 2⁴  =  2² * 2 ² 
 ex) 지수가 홀수일 때: 2⁵ = 2² * 2 ² * 2 
-> ⭐️매번 반씩 지수가 줄어드니 log(B)⭐️ 로 구할 수 있음
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (x, n, d) = (input[0], input[1], input[2])

func dfs(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }

    if n % 2 == 0 {
        let halfAns = dfs(n/2)
        return halfAns%d * halfAns%d
    } else {
        let halfAns = dfs((n-1)/2)
        return halfAns%d * halfAns%d * x%d
    }
}

print(dfs(n))

// 1️⃣ 시간초과: n이 0이 될때까지 n-1로 재귀

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (x, n, d) = (input[0], input[1], input[2])
//
//func sol(_ x: Int, _ n: Int, _ d: Int, _ ans: Int) {
//    if n == 0 {
//        print(ans)
//        return
//    }
//
//    var ans2: Int = ans * x % d
//    sol(x, n-1, d, ans2)
//}
//
//sol(x, n, d, 1)
