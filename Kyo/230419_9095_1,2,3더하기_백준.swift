//230419_9095_1,2,3더하기_백준
let testcase = Int(readLine()!)!

var array: [Int] = Array(repeating: 0, count: 11)
array[1] = 1    // 1 : 1 가지
array[2] = 2    // 1 + 1 /  2 : 2 가지
array[3] = 4    // 1 + 1 + 1 / 1 + 2 / 2 + 1 / 3 : 4 가지

for _ in 0..<testcase {
    let input = Int(readLine()!)!
    
    switch input {
    case 1:
        print(1)
        continue
    case 2:
        print(2)
        continue
    case 3:
        print(4)
        continue
    default:
        var number = 4
        while number <= input {
            array[number] = array[number - 1] + array[number - 2] + array[number - 3]
            number += 1
        }
        
        print(array[input])
    }
}
