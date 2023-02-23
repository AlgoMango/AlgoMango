// https://school.programmers.co.kr/learn/courses/30/lessons/150370
// 년월일을 Array로 [[년도][월][일]]로 만들어서 비교했는데, 한달이 공통적으로 28일이라고 주어졌으므로 일로 계산해서 바꾸는게 코드가 깔끔..!


func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var todayArray: [Int] = today.split(separator: ".").map { Int($0)! } // [2022,05,19]
    var termsDictionary: Dictionary<String, Int> = [:] // ["A": 6, ...]
    var privaciesSet: [([Int], String)] = [] // [([2021,05,02], "A")]
    var answer: [Int] = []

    for term in terms {
        let termArray: [String] = term.split(separator: " ").map { String($0) }
        let type: String = termArray[0]
        let month: Int = Int(termArray[1])!
        termsDictionary[type] = month
    }

    for privacy in privacies {
        let privacyArray = privacy.split(separator: " ") // ["2021.05.02", A]
        let dateArray: [Int] = privacyArray[0].split(separator: ".").map { Int($0)! } // [2021,05,02]
        let type: String = String(privacyArray[1])

        privaciesSet.append( (dateArray, type) )
    }

    for (index, privacySet) in privaciesSet.enumerated() {
        let type = privacySet.1
        let month = termsDictionary[type]! % 12
        let year = termsDictionary[type]! / 12
        var date = privacySet.0

        date[0] += year

        if month == 12 {
            date[0] += 1
        } else if date[1] + month > 12 {
            date[1] = date[1] + month - 12
            date[0] += 1
        } else {
            date[1] = date[1] + month
        }

        if date[2] - 1 == 0 {
            date[2] = 28
            date[1] -= 1
            if date[1] == 0 {
                date[1] = 12
                date[0] -= 1
            }
        } else {
            date[2] -= 1
        }

        if todayArray[0] > date[0] {
            answer.append(index + 1)
        } else if todayArray[0] == date[0] && todayArray[1] > date[1] {
            answer.append(index + 1)
        } else if todayArray[0] == date[0] && todayArray[1] == date[1] && todayArray[2] > date[2] {
            answer.append(index + 1)
        }
    }

    return answer
}
