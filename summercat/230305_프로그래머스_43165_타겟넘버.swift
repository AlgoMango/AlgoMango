// 재귀
var numbersCopy: [Int] = []
var max: Int = 0
var targetSum: Int = 0
var answer: Int = 0

func solution(_ numbers: [Int], _ target: Int) -> Int {
  numbersCopy = numbers
  max = numbers.count
  targetSum = target
  
  recur(0, 0)
  
  print(answer)
  return answer
}

func recur(_ idx: Int, _ cur: Int) {
  if idx == max {
    if cur == targetSum {
      answer += 1
      return
    }
    else { return }
  }
  
  // 현재 idx 값을 더하거나 빼거나
  // print(idx, cur)
  recur(idx + 1, cur + numbersCopy[idx])
  recur(idx + 1, cur - numbersCopy[idx])
}



// dfs (예전에 푼 풀이)
func solution(_ numbers: [Int], _ target: Int) -> Int {
    var graph = Array(repeating: Array(repeating: 0, count: 2), count: numbers.count + 1)
    var visited = Array(repeating: false, count: numbers.count + 1)
    var sum = 0
    var count = 0
    
    for i in 0..<numbers.count {
        graph[i][0] = numbers[i]
        graph[i][1] = -numbers[i]
    }
    print(graph)
    
    func dfs(depth: Int) {
        if depth == numbers.count && sum == target {
            count += 1
        }
        if depth == numbers.count { return }
        
        for i in 0...depth {
            if visited[i] == false {
                visited[i] = true
                for j in 0..<2 {
                    sum += graph[i][j]
                    dfs(depth: depth + 1)
                    sum -= graph[i][j]
                }
                visited[i] = false
            }
            
        }
    }
    
    dfs(depth: 0)
    
    return count
}
