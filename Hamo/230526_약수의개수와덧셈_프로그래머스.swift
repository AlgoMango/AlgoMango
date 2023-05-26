import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    
    for target in left...right {
        var count = 0
        for num in 1...Int(sqrt(Double(target))) {
            if num * num == target {
                count += 1
            } else if target % num == 0 {
                count += 2
            }
        }
        
        if count % 2 == 0 {
            result += target
        } else {
            result -= target
        }
    }
    
    return result
}
