//230507_파일명정렬_프로그래머스
func solution(_ files:[String]) -> [String] {
    // 1. Head 기준 사전순 정렬 대소문자 구분안한다.
    // 2. 그다음 숫자순 0은 무시된다 
    // 3. 원래 입력으로 파일 정렬 
    
    var files = files.sorted { A, B in
        // Head 기준 
        var arrayA = A.map { String($0) }
        var arrayB = B.map { String($0) }
                              
        var headA = ""
        var headB = ""
                   
        var numberStartIndexA = 0
        var numberStartIndexB = 0
        
        // Head 구하기 
        for index in 0..<arrayA.count {
            if let number = Int(arrayA[index]) {
                numberStartIndexA = index
                break
            }
            
            headA += arrayA[index]
        }
                              
        for index in 0..<arrayB.count {
            if let number = Int(arrayB[index]) {
                numberStartIndexB = index
                break
            }
            
            headB += arrayB[index]
        }
        
        // Head 정렬
        if headA.lowercased() < headB.lowercased() {
            return true
        } else if headA.lowercased() > headB.lowercased() {
            return false
        }
                                                  
        var numberA = ""
        var numberB = ""
    
        // Number구하기
        for index in numberStartIndexA..<arrayA.count {
            if let number = Int(arrayA[index]) {
                numberA += String(number)
                continue
            }
            
            break
        }
        
        for index in numberStartIndexB..<arrayB.count {
            if let number = Int(arrayB[index]) {
                numberB += String(number)
                continue
            }
            
            break
        }                     
        
        // Number로 정렬
        if Int(numberA)! < Int(numberB)! {
            return true
        } else if Int(numberA)! > Int(numberB)! {
            return false
        }
            
        // 그 외는 그대로
        return false
    }
    
    return files
}
