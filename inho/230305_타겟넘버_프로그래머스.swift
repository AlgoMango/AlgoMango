//https://school.programmers.co.kr/learn/courses/30/lessons/43165

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    func dfs(i: Int, sum: Int) {
        guard i < numbers.count else {
            if sum == target { answer += 1 }
            return
        }
        
        dfs(i: i+1, sum: sum + numbers[i])
        dfs(i: i+1, sum: sum - numbers[i])
    }
    
    dfs(i: 0, sum: 0)

    return answer
}
/*
               0
        1            -1
    1     -1      1     -1 
  1  -1  1  -1  1  -1  1  -1
            ...
*/
