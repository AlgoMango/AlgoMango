//https://school.programmers.co.kr/learn/courses/30/lessons/42862#

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let sortedLost = lost.filter({ !reserve.contains($0) }).sorted()
    var sortedReserve = reserve.filter({ !lost.contains($0) }).sorted() //여분도 있고 도난도 당한 사람 필터
    var students = n - sortedLost.count
    
    for lose in sortedLost {
        for index in 0..<sortedReserve.count {
            if lose == sortedReserve[index]-1 || lose == sortedReserve[index]+1 {
                sortedReserve.remove(at: index)
                students += 1
                
                break
            }
        }
    }

    return students
}
