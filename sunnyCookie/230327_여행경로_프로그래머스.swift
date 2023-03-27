
// https://school.programmers.co.kr/learn/courses/30/lessons/43164
/*
 문제풀이
 주어진 항공권을 모두 이용한 여행경로짜기. 항상 "ICN" 공항에서 출발한다. tickets(2차원배열)을 이용해 방문하는 공항 경로를 배열로 반환
 (가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 반환)
 ex) [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]] => ["ICN", "JFK", "HND", "IAD"]
 ------------------------------------------------------------------------------------
 풀이
 연결을 딕셔너리 Key에 연결된 곳이 여러 곳이면 stack에 두면서 확인..
 */

func solution(_ tickets:[[String]]) -> [String] {
    var dictionary: [String: [String]] = [:]
    var path: [String] = ["ICN"]
    
    for ticket in tickets {
        // Key에 값이 있으면 배열에 추가                                   // ["ICN", "JFK"] 다음 path 연결되는 곳 딕셔너리 Key로 정리
        guard dictionary[ticket[0]] == nil else {                   //   Key    Value
            dictionary[ticket[0]]?.append(ticket[1])
            dictionary[ticket[0]] = dictionary[ticket[0]]?.sorted(by: >) // 알파벳 순서가 앞서는 경로를 반환해야되는데 뒤에서, removeLast()할거라 맨뒤에 작은 값
            continue
        }
        
        dictionary[ticket[0]] = [ticket[1]] // Key에 맞는 Value가 없었으면 배열에 Value 담아서 지정
    }
    
    var stack: [(p: [String], d: [String: [String]])] = [(p: path, d: dictionary)] // stack에 dictionary같이 저장
    
    while !stack.isEmpty {
        let stackLast = stack.removeLast()
        var (p2, d2) = (stackLast.p, stackLast.d)
        
        guard p2.count != tickets.count + 1 else { // p2가 경로수를 채우면 정답이니까 반환
            return p2
        }
        
        guard var nextPaths = d2[p2.last!] else { continue } // 딕셔너리에 다음 경로가없으면 길을 잘못온거
        
        if nextPaths.count == 1 { // 딕셔너리에 다음경로가 한개만 바로 추가해서 담기
            d2[p2.last!] = nil
            p2.append(nextPaths[0])
            stack.append((p: p2, d:d2))
        } else {                    // 딕셔너리에 다음경로가 여러개면 for문돌면서 각각 다음길 추가한거, 딕셔너리 수정한거 stack에 추가
            for (i, nextPath) in nextPaths.enumerated() {
                var (p2Copy, d2Copy) = (p2, d2)
                p2Copy.append(nextPath)
                d2Copy[p2.last!]?.remove(at: i)
                stack.append((p: p2Copy, d: d2Copy))
            }
        }
    }
    
    return path // 정답아님 위에서 return 되면서 정답도출됌
}
