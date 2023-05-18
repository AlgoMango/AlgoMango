//https://school.programmers.co.kr/learn/courses/30/lessons/17680

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var result = 0
    
    guard cacheSize > 0 else { return cities.count * 5 }
    
    for city in cities {
        let lowercasedCity = city.lowercased()
        
        if cache.contains(lowercasedCity) {
            result += 1
        } else {
            if cache.count == cacheSize {
                cache.removeFirst()
            }
            
            if cache.count < cacheSize {
                cache.append(lowercasedCity)
            }
            
            result += 5
        }
    }
    
    return result
}
