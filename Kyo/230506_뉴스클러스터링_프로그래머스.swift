//230506_뉴스클러스터링_프로그래머스

func solution(_ str1:String, _ str2:String) -> Int {
    // 입력으로 들어온 문자열은 두 글자씩 끊어서 다중집합의 원소로 만든다.
    // 영문자 쌍만 유효, 소문자 대문자 상관없음.
    var alpha: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    var arrayA: [String] = []
    var arrayB: [String] = []
    var strArrayA = str1.lowercased.map { String($0) }
    var strArrayB = str2.lowercased.map { String($0) }
    
    for index in 0..<strArrayA.count-1 {
        if alpha.contains(strArrayA[index]) && alpha.contains(strArrayA[index+1]) {
            var temp: String = strArrayA[index] + strArrayA[index+1]
            arrayA.append(temp)
        }
    }
    
    for index in 0..<strArrayB.count-1 {
        if alpha.contains(strArrayB[index]) && alpha.contains(strArrayB[index+1]) {
            var temp: String = strArrayB[index] + strArrayB[index+1]
            arrayB.append(temp)
        }
    }
    
    // 교집합 구하기
    var kyo: [String] = []
    var tempArrayB = arrayB
    
    for item in arrayA {
        if tempArrayB.contains(item) {
            let index = tempArrayB.firstIndex(of: item)!
            tempArrayB.remove(at: index)
            kyo.append(item)
        }
    }
    
    // 합집합 구하기
    var hap: [String] = arrayA + arrayB
    
    for item in kyo {
        let index = hap.firstIndex(of: item)!
        hap.remove(at: index)
    }

    // 출력
    if hap.count == kyo.count {
        return 65536
    } else {
        return Int((Double(kyo.count) / Double(hap.count)) * 65536)
    }
}
