//https://school.programmers.co.kr/learn/courses/30/lessons/17687
//String(_:radix:) 메모,,

func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    var stack = [String]()
    var currentNumber = 0
    var index = 1
    var result = ""
    
    while result.count != t {
        if stack.isEmpty {
            stack = String(currentNumber, radix: n, uppercase: true).map({ String($0) })
            currentNumber += 1
        }
        let number = stack.removeFirst()
        
        if index == p { result.append(number)}
        
        index = index == m ? 1 : index + 1
    }
    
    return result
}
