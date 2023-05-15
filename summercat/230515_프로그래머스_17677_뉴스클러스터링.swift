// 교집합 크기를 합집합 크기로 나눈 값
// 문자열을 두 글자씩 끊어서 원소로
// 공백, 숫자, 특수문자가 들어간 경우 버림
// 대문자 소문자는 같은 글자로 취급

var first: [String] = []
var second: [String] = []

func solution(_ str1:String, _ str2:String) -> Int {
    first = str1.map { String($0) }
    second = str2.map { String($0) }
    
    let firstElements = makeSet(first)
    let secondElements = makeSet(second)

    let result = count(firstElements, secondElements)
    if result.union == 0 { return 65536 }
    
    return result.intersection * 65536 / result.union
}

func makeSet(_ arr: [String]) -> [String] {
    var temp: [String] = []
    var idx: Int = 0
    var elements: [String] = []
    
    while idx < arr.count {
        let current = arr[idx]
        
        if "a"..."z" ~= current || "A"..."Z" ~= current {
            temp.append(current.lowercased())
        } else {
            temp = []
        }
        
        if temp.count == 2 {
            elements.append(temp.joined())
            temp.removeFirst()
        }
        
        idx += 1
    }
    
    return elements
}

func count(_ arr1: [String], _ arr2: [String]) -> (union: Int, intersection: Int) {
    var firstDict: [String: Int] = [:]
    var secondDict: [String: Int] = [:]
    var unionCount: Int = 0
    var intersectionCount: Int = 0
    
    for word in arr1 {
        firstDict[word, default: 0] += 1
    }
    
    for word in arr2 {
        secondDict[word, default: 0] += 1
    }
    
    for (key, value) in firstDict {
        let second = secondDict[key, default: 0]
        if second == 0 {
            unionCount += value
        } else {
            if second > value { intersectionCount += value }
            else { unionCount += value }
        }
    }
    
    for (key, value) in secondDict {
        let first = firstDict[key, default: 0]
        if firstDict[key, default: 0] == 0 {
            unionCount += value
        } else {
            if first > value { intersectionCount += value }
            else if first == value { intersectionCount += value }
            else { unionCount += value }
        }
    }
    
    return (union: unionCount, intersection: intersectionCount) 
}
