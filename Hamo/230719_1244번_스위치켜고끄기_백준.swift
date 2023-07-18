import Foundation

let count = Int(readLine()!)!
var switches: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let studentCount = Int(readLine()!)!

func switchMale(number: Int) {
    var currentNum = 1
    var checkNum = number * currentNum

    while checkNum - 1 < switches.count {
        switches[checkNum - 1] = switches[checkNum - 1] == 1 ? 0 : 1
        currentNum += 1
        checkNum = number * currentNum
    }
}

func switchFemale(number: Int) {
    var currentArea = 1
    switches[number - 1] = switches[number - 1] == 1 ? 0 : 1
    var left = number - currentArea - 1
    var right = number + currentArea - 1

    while (left >= 0) && (right < switches.count) {
        if switches[left] == switches[right] {
            switches[left] = switches[left] == 1 ? 0 : 1
            switches[right] = switches[left]

            currentArea += 1
            left = number - currentArea - 1
            right = number + currentArea - 1
        } else {
            break
        }
    }
}

for _ in 1...studentCount {
    let info = readLine()!.split(separator: " ").map { Int($0)! }

    if info[0] == 1 {
        switchMale(number: info[1])
    } else {
        switchFemale(number: info[1])
    }
}

var tempCount: Int =  1

for studentSwitch in switches {
    print(studentSwitch, terminator: " ")
    if tempCount % 20 == 0 {
        print("")
    }
    
    tempCount += 1
}
