//이 규칙을 어떻게 아냐구,,,

func solution(_ numbers:[Int64]) -> [Int64] {
    var result: [Int64] = []
    
    for number in numbers {
        if number % 2 == 0 {
            result.append(number + 1)
        } else {
            var binary = Array(String(number, radix: 2))
            
            if binary.contains("0") {
                let index = binary.lastIndex(of: "0")!
                binary[index] = "1"
                binary[index+1] = "0"
            } else {
                binary.removeFirst()
                binary = ["1", "0"] + binary
            }
            
            result.append(Int64(String(binary), radix: 2)!)
        }
    }
    
    return result
}
