//// 시간 초과
//func solution(_ number:String, _ k:Int) -> String {
//    var num = number.map { Int(String($0))! }
//    var numCount = num.count - k
//    var result = ""
//    var max = Array(num[0...num.count - numCount]).max()!
//    var currentIndex = num.firstIndex(of: max)!
//    result += max.description
//    numCount -= 1
//
//    while numCount != 0 {
//        let a = Array(num[currentIndex + 1...num.count - numCount]).max(by: { $0 > $1 })
//        currentIndex += Array(num[currentIndex + 1...num.count - numCount]).firstIndex(of: max)! + 1
//        result += max.description
//        numCount -= 1
//    }
//
//    return result
//}

// 얘도 시간초과
func solution(_ number:String, _ k:Int) -> String {
    var num = number.map { Int(String($0))! }
    var numCount = num.count - k
    var result = ""
    var currentIndex = -1

    while numCount != 0 {
        var maxInfo: (index: Int, value: Int) = (0, 0)
        
        for (index, element) in Array(num[currentIndex + 1...num.count - numCount]).enumerated() {
            if element > maxInfo.value {
                maxInfo = (index, element)
            }
        }
        
        currentIndex += maxInfo.index + 1
        result += maxInfo.value.description
        numCount -= 1
    }
    
    return result
}
