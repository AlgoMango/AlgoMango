//https://www.acmicpc.net/problem/1992
// 색종이랑 비슷

func solution() {
    let count = Int(readLine()!)!
    var graph = [[Int]]()
    var result = String()
    
    for _ in 0..<count {
        let input = Array(readLine()!).map({ Int(String($0))! })
        
        graph.append(input)
    }
    
    func recursive(_ array: [[Int]]) {
        let flatten = array.flatMap({ $0 })
        
        if flatten.filter({ $0 != 0 }).count == 0 {
            result.append("0")
        } else if flatten.filter({ $0 != 1 }).count == 0 {
            result.append("1")
        } else {
            let half = array.count / 2
            
            result.append("(")
            recursive(divideArray(array, width: (0, half), height: (0, half))) //왼쪽위, 오른쪽위, 왼쪽아래, 오른쪽 아래 순서대로 해야함
            recursive(divideArray(array, width: (half, array.count), height: (0, half)))
            recursive(divideArray(array, width: (0, half), height: (half, array.count)))
            recursive(divideArray(array, width: (half, array.count), height: (half, array.count)))
            result.append(")")
        }
    }

    func divideArray(_ array: [[Int]], width: (Int, Int), height: (Int, Int)) -> [[Int]] {
        var result = [[Int]]()

        for i in height.0..<height.1 {
            result.append(Array(array[i][width.0..<width.1]))
        }

        return result
    }
    
    recursive(graph)
    print(result)
}

solution()
