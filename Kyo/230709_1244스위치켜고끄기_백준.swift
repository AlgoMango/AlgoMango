// 230709_1244스위치켜고끄기_백준
// 남자 : 배수의 스위치 상태를 바꾼다 (자신 번호 포함)
// 여자 : 양옆 대칭의 상태를 바꾼다. (자신포함)

let switchTotal = Int(readLine()!)!     // 스위치 갯수

// 스위치 상태
var switchBoard = readLine()!.split(separator: " ").map { Int(String($0))! }
switchBoard.insert(-1, at: 0)
var peopleTotal = Int(readLine()!)!     // 학생 수

for _ in 0..<peopleTotal {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    switch input[0] {
    case 1:
        changeSwitchMen(number: input[1])
    case 2:
        changeSwitchWoman(number: input[1])
    default:
        continue
    }
}

// Output
var count = 1
for index in 1..<switchBoard.count {
    // 한줄에 20개씩 출력
    if index != 20 * count && index / 20 == count {
        print("")
        count += 1
    }
    print(switchBoard[index], terminator: " ")
}


// Function
func changeSwitchMen(number: Int) {
    for index in number..<switchTotal + 1 {
        if index % number == 0 {
            switchBoard[index] = switchBoard[index] == 0 ? 1 : 0
        }
    }
}

func changeSwitchWoman(number: Int) {
    var changeTarget: Set<Int> = []
    var start = number
    var end = number
    
    while switchBoard[start] == switchBoard[end] {
        changeTarget.insert(start)
        changeTarget.insert(end)
        
        start -= 1
        end += 1
        
        if start == 0 || end > switchTotal { break }
    }
    
    for target in changeTarget {
        switchBoard[target] = switchBoard[target] == 0 ? 1 : 0
    }
}
