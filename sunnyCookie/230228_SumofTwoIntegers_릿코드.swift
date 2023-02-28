// https://leetcode.com/problems/sum-of-two-integers/description/
/*
문제설명
    주어지는 두 정수 a, b의 합을 +, - 를 사용하지않고 리턴하는 함수만들기
    -1000 <= a, b <= 1000

풀이
    양수 음수를 구별하기위해 양수array, 음수array를 만들어서 반복문으로 요소를 담고 count를 이용해 리턴했는데

더맞는풀이
    비트를 다룰 줄 알아야함 ( 고급연산자 |, ^, & ) 
    아직 공부를 몬해서 다음에 다시봐야겠음..⭐️
*/

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var plusArray: [Int] = []
        var minusArray: [Int] = []

        for _ in 0..<abs(a) {
            a >= 0 ? plusArray.append(0) : minusArray.append(0)
        } 

        for _ in 0..<abs(b) {
            b >= 0 ? plusArray.append(0) : minusArray.append(0)
        } 

        if !minusArray.isEmpty {
            for _ in minusArray {
                if plusArray.isEmpty {
                     break
                 } else { 
                     plusArray.removeLast()
                     minusArray.removeLast()
                 }
            }
        }

        if plusArray.isEmpty {
            return -minusArray.count
        } else {
            return plusArray.count
        }
    }
}
