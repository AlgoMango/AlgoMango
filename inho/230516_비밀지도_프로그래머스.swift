//https://school.programmers.co.kr/learn/courses/30/lessons/17681

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for (x, y) in zip(arr1, arr2) {
        var binaryX = x, binaryY = y
        var firstWall = String()
        var secondWall = String()
        var wall = String()
        
        for i in stride(from: n-1, to: -1, by: -1) {
            if binaryX >= Int(pow(Float(2), Float(i))) {
                binaryX -= Int(pow(Float(2), Float(i)))
                firstWall.append("#")
            } else {
                firstWall.append(" ")
            }
            
            if binaryY >= Int(pow(Float(2), Float(i))) {
                binaryY -= Int(pow(Float(2), Float(i)))
                secondWall.append("#")
            } else {
                secondWall.append(" ")
            }
        }
        
        for item in zip(firstWall, secondWall) {
            if item.0 == "#" {
                wall.append("#")
            } else if item.1 == "#" {
                wall.append("#")
            } else {
                wall.append(" ")
            }
        }
        
        answer.append(wall)
    }
    
    return answer
}
