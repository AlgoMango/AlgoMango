//https://www.acmicpc.net/problem/2630

func solution() {
    let n = Int(readLine()!)!
    var graph = [[Int]]()
    var result: (Int, Int) = (0, 0)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        graph.append(input)
    }
    
    func recursive(_ array: [[Int]]) { //재귀를 도는 함수
        let flatten = array.flatMap({ $0 })
        
        if flatten.filter({ $0 != 0 }).count == 0 { //모든 종이가 0이면 결과 + 1
            result.0 += 1
        } else if flatten.filter({ $0 != 1 }).count == 0 { //모든 종이가 1이면 결과 + 1
            result.1 += 1
        } else { //조건이 맞지 않으면 4등분 & 재귀
            let half = array.count / 2
          
            recursive(divideArray(array, width: (0, half), height: (0, half)))
            recursive(divideArray(array, width: (0, half), height: (half, array.count)))
            recursive(divideArray(array, width: (half, array.count), height: (0, half)))
            recursive(divideArray(array, width: (half, array.count), height: (half, array.count)))
        }
    }
    
    func divideArray(_ array: [[Int]], width: (Int, Int), height: (Int, Int)) -> [[Int]] { //입력받은 배열을 범위로 잘라 리턴하는 함수
        var result = [[Int]]()                                                             //4조각 중 1조각 리턴
        
        for i in height.0..<height.1 {
            result.append(Array(array[i][width.0..<width.1]))
        }
        
        return result
    }
    
    recursive(graph)
    
    print(result.0, result.1, separator: "\n")
}

solution()
