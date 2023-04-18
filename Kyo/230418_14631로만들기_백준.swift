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


var dynamicArray: [Int] = Array(repeating: 0, count: input + 1)
dynamicArray[1] = 0
var start = 2

while start <= input {
    
    let minusCase = dynamicArray[start - 1] + 1
    dynamicArray[start] = minusCase
    
    if start % 2 == 0 {
        dynamicArray[start] = min(dynamicArray[start / 2] + 1, dynamicArray[start])
    }
    
    if start % 3 == 0 {
        dynamicArray[start] = min(dynamicArray[start / 3] + 1, dynamicArray[start])
    }
    
    start += 1
}

print(dynamicArray[input])
