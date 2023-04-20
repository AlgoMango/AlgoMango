//230420_1904_01타일_백준

let input = Int(readLine()!)!

var array: [Int] = Array(repeating: 0, count: 1000001)

array[0] = 1
array[1] = 1
array[2] = 2

var index = 3
while index <= input {
    array[index] = (array[index - 1] + array[index - 2]) % 15746
    index += 1
}

print(array[input])
