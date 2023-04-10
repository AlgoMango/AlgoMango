//230410_15652N과M(4)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]    // ex : 4
let m = input[1]    // ex : 2

var array: [Int] = Array(repeating: 0, count: m)    // 출력할 배열

func recursive(_ number: Int, start: Int) {
    if number == m {
        for item in array {
            print(item, terminator: " ")
        }
        print("")
        return
    }
        
    // start부터 시작하게끔 해서 방문 체크할 필요가 없음
    for item in start..<n {
        array[number] = item + 1
        recursive(number + 1, start: item) // item을 넣음으로서 1 1 / 2 2 / 3 3 출력 가능
    }
}

recursive(0, start: 0)
