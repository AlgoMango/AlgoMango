//230504_11501주식_백준

let testcase = Int(readLine()!)!

for _ in 0..<testcase {
    let input = Int(readLine()!)!
    let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
         
    var maxNumber = 0
    var total = 0
  
  // 역 방향으로 생각
    for index in (0..<array.count).reversed() {
        if array[index] > maxNumber {
            maxNumber = array[index]
            continue
        } else {
            total += (maxNumber - array[index])
        }
    }
    
    print(total)
}
