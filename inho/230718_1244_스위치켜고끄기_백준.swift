//걸린 시간: 25분
//깡 구현,,

func solution() {
    let switchCount = Int(readLine()!)!
    var switchStatus: [Bool] = readLine()!.split(separator: " ").compactMap { Int($0) == 1 ? true : false }
    
    let studentCount = Int(readLine()!)!
    var students: [(isMale: Bool, index: Int)] = []
    
    for _ in 1...studentCount {
        let student = readLine()!.split(separator: " ").map { String($0) }
        let isMale = student[0] == "1"
        students.append((isMale, Int(student[1])! - 1))
    }
    
    for student in students {
        if student.isMale {
            var index = student.index
            let next = student.index + 1
            
            while index < switchStatus.count {
                switchStatus[index].toggle()
                index += next
            }
        } else {
            var left = student.index, right = student.index
            
            switchStatus[left].toggle()
            left -= 1
            right += 1
            
            while left >= 0 && right < switchCount && switchStatus[left] == switchStatus[right] {
                switchStatus[left].toggle()
                switchStatus[right].toggle()
                left -= 1
                right += 1
            }
        }
    }
    
    for count in 1...switchCount {
        print(switchStatus[count-1] ? 1 : 0, terminator: " ")
        if count % 20 == 0 {
            print("")
        }
    }
    
}

solution()
