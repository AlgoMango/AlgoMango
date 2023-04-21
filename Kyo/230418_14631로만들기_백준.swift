//230418_14631로만들기_백준

/*
 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 
 5 -> 4 -> 2 -> 1 : 3
 10 -> 9 -> 3 -> 1 : 3
 D[K] = D[K - 1] + 1 or D[K/3] + 1 or D[K/2] + 1
*/

let input = Int(readLine()!)!

var counting: [Int] = Array(repeating: 0, count: input + 2)

/*
 counting[1] = 0
 counting[2] = 1
 counting[3] = 1
 counting[4] = 2  counting[3] + 1
 counting[5] = 3, counting[4] + 1
 */

counting[1] = 0
counting[2] = 1

if input > 2 {
    for number in 3..<input+1 {
        
        var beforeCount = counting[number - 1] + 1
        
        if number % 2 == 0 {
            beforeCount = min(counting[number / 2] + 1, beforeCount)
        }
        
        if number % 3 == 0 {
            beforeCount = min(counting[number / 3] + 1, beforeCount)
        }
        
        counting[number] = beforeCount
    }
}

print(counting[input])
