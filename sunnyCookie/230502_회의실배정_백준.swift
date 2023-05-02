// https://www.acmicpc.net/problem/1931

let n: Int = Int(readLine()!)!
var schedules: [[Int]] = []

for _ in 0..<n {
    schedules.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

schedules.sort { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
var currentSchedule: [Int] = schedules[0]
var count: Int = 1

for i in 1..<schedules.count {
    // 시작하자마자 끝나는 조건인지 확인
    if currentSchedule[0] == currentSchedule[1] {
        count += 1

        if i+1 < schedules.count {
            currentSchedule = schedules[i]
        }
        
        continue
    }

    //다음 스케쥴의 끝나는시간이 이전 스케쥴끝나는시간보다 적으면 갈아치우기
    if schedules[i][1] < currentSchedule[1] {
        currentSchedule = schedules[i]
        continue
    }

    //다음 스케쥴의 시작시간이 이전스케쥴의 끝나는시간보다 크면 스케쥴 추가하기
    if schedules[i][0] >= currentSchedule[1] {
        count += 1
        currentSchedule = schedules[i]
    }
}

print(count)
