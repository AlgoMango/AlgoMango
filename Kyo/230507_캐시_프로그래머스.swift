//230507_캐시_프로그래머스
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var board: [String] = []
    var answer = 0
    
    // 캐시 사이즈 0 일 경우는 보관 못함
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    // 소문자로 변경
    var newCities = cities.map { $0.lowercased() }
    
    for city in newCities {
        // 캐시가 여분이 있고, 중복은 안담는 조건문
        if board.count < cacheSize && !board.contains(city) {
            board.append(city)
            answer += 5
            continue
        }
        
        if board.contains(city) {
            let index = board.firstIndex(of: city)
            board.remove(at: index!)
            board.append(city)
            answer += 1
        } else {
            board.removeFirst()
            board.append(city)
            answer += 5
        }
    }
    
    return answer
}
