//https://www.acmicpc.net/problem/2448
/*
["  *  ", " * * ", "*****"]를 단위로 위와 옆으로 늘려가는 방식
*/

func solution() {
    let count = Int(readLine()!)!
    
    func drawStar(height: Int, current: [String]) {
        if height == count {
            current.forEach { print($0) }
            return
        }
        
        let top = current.map {
           "\(String(repeating: " ", count: height) + $0 + String(repeating: " ", count: height))"
        }
        let bottom = current.map { "\($0) \($0)" }
        
        drawStar(height: height*2, current: top+bottom)
    }
    
    drawStar(height: 3, current: ["  *  ", " * * ", "*****"])
}

solution()
