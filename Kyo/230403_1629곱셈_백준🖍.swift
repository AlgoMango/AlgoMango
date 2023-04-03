//230403_1629곱셈_백준

// 아래 코드 런타임 오류 
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let baseNumber = input[0] % input[2]
let countNumber = input[1]
let divideNumber = input[2]
var answerNumber: Int = 0
var numbers: [Int] = Array(repeating: 0, count: countNumber + 1)


func result(base: Int, count: Int, divide: Int, answer: Int) {
    if count == countNumber {
        answerNumber = answer
        return
    }
    
    let num = (answer % divide) * (base % divide)
    result(base: base, count: count + 1, divide: divide, answer: num)
}

result(base: baseNumber, count: 0, divide: divideNumber, answer: 1)
print(answerNumber)


// 아래코드가 정답 코드
// 곱해야하는 횟수를 절반으로 쪼개니깐 log(n)
func dfs(_ count : Int) -> Int  {
    if count == 0 { return 1 }

    if count % 2 == 0 {
        let number = dfs(count / 2)
        return number % divideNumber * number % divideNumber
    } else {
        let number = dfs((count - 1) / 2) 
        return number % divideNumber * number % divideNumber * baseNumber % divideNumber
    }
}

print(dfs(countNumber))
