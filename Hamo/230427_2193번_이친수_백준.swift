import Foundation

let N = Int(readLine()!)!
var arr: [(zero: Int, one: Int)] = Array(repeating: (0, 0), count: 95)
arr[1] = (0, 1)

if N == 1 {
    print(1)
    exit(0)
}

for i in 2...N {
    arr[i].zero = arr[i - 1].zero + arr[i - 1].one
    arr[i].one = arr[i - 1].zero
}

print(arr[N].zero + arr[N].one)
