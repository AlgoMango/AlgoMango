import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var results: [Int64] = []
    
    for num in numbers {
        if num % 2 == 0 {
            results.append(num + 1)
            continue
        }
        
        var bit = String(num, radix: 2).map { String($0) }
        
        guard let index = bit.lastIndex(of: "0") else {
            bit[0] = "0"
            let result = "1" + bit.joined()
            results.append(Int64(result, radix: 2)!)
            
            continue
        }

        bit[index] = "1"
        bit[index + 1] = "0"
        results.append(Int64(bit.joined(), radix: 2)!)
        
    }
    
    return results
}
