import Foundation

var ticketsCopy: [[String]] = []
var used: [Bool] = []
var starts: [(idx: Int, to: String)] = []
var answers: [[String]] = []

func solution(_ tickets:[[String]]) -> [String] {
    var answer: [String] = ["ICN"]
    ticketsCopy = tickets
    ticketsCopy.sort { $0[1] < $1[1] }
    
    for i in 0..<tickets.count {
        if ticketsCopy[i][0] == "ICN" {
            starts.append((i, ticketsCopy[i][1]))
        }
    }
    
    starts.sort { $0.to < $1.to }
    
    for i in 0..<starts.count {
        used = Array(repeating: false, count: tickets.count)
        let startIdx = starts[i].idx
        dfs(startIdx, 1, [ticketsCopy[startIdx][1]])
    }
    
    answer.append(contentsOf: answers[0])
    
    return answer
}

func dfs(_ idx: Int, _ depth: Int, _ route: [String]) {
    if depth == ticketsCopy.count {
        answers.append(route)
    }
    
    used[idx] = true
    
    for i in 0..<ticketsCopy.count {
        if used[i] { continue }
        if route.last! == ticketsCopy[i][0] {
            var addRoute = route
            addRoute.append(ticketsCopy[i][1])
            used[i] = true
            dfs(i, depth + 1, addRoute)
            used[i] = false
        }
    }
}
