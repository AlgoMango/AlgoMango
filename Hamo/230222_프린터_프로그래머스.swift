import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var left: [(index: Int, value: Int)] = []
    var right: [(index: Int, value: Int)] = []
    var result = 0
    
    for (index, value) in priorities.enumerated() {
        left.append((index, value))
    }
    
    left = left.reversed()
    
    while !left.isEmpty || !right.isEmpty {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        
        let currentPrint = left.removeLast()
        
        let temp = (left + right).filter { $0.value > currentPrint.value }
        
        if temp.isEmpty && currentPrint.index == location {
            result = priorities.count - (right.count + left.count)
            break
        } else if !temp.isEmpty {
            right.append(currentPrint)
        }
    }
    
    return result
}
