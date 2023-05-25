import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let tempCities = cities.map { $0.uppercased() }
    
    var cache: [String] = []
    var result = 0
    
    for city in tempCities {
        if cache.contains(city) {
            result += 1
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
        } else {
            result += 5
            cache.append(city)
            
            if cache.count > cacheSize {
                cache.removeFirst()
            }
                
        }
    }
    
    return result
}
