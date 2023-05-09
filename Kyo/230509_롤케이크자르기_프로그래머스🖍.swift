//230509_롤케이크자르기_프로그래머스
/*
살짝 컨닝..
기존방법은 시간초과..
*/

import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    
    var setA: Set<Int> = []
    var setB: Set<Int> = Set(topping)
    
    var dict: [Int:Int] = [:]
    
    for top in topping {
        dict[top] = (dict[top] ?? 0) + 1
    }
    
    for index in 0..<topping.count {
        setA.insert(topping[index])
        dict[topping[index]]! -= 1
        
        if dict[topping[index]]! == 0 {
            setB.remove(topping[index])
        }
        
        if setA.count > setB.count {
            break
        }
        
        if setA.count == setB.count {
            answer += 1 
        }
    }
    
    return answer 
}

/*
func solution(_ topping:[Int]) -> Int {
    var answer = 0
    var arrayA: [Int] = []
    var arrayB: [Int] = topping.reversed()
    
    
    for index in 0..<topping.count {
        arrayA.append(arrayB.removeLast())
        
        if Set(arrayA).count == Set(arrayB).count {
            answer += 1
        }
    }
    
    return answer
}
*/
