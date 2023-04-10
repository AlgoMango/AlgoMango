//230408_15650_N과M(2)_백준

// 1부터 n까지 길이가 m인 수열을 모두 구해라
// 사진 순으로, 중복 없이, 사전 순,
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]
var visit: [Bool] = Array(repeating: false, count: n + 1)
var permutation: [Int] = Array(repeating: 0, count: m)

func recursion(number: Int, maxNumber: Int) {
    if number == m { // 만약 m개를 모두 골랐다면.
        for item in permutation {
            print(item, terminator: " ")
        }
        print("")
        return
    }

    // 만약 m개를 못 골랐다면.
    for index in 0..<n {
        if visit[index] { continue }
        if maxNumber > index + 1 { continue } // maxNumber으로 현재의 가장 큰 숫자를 저장해 놓는다.

        visit[index] = true

        permutation[number] = index + 1
        recursion(number: number + 1, maxNumber: index + 1)
        visit[index] = false    // 다시 방문 가능하게 변경
    }
}

recursion(number: 0, maxNumber: 0)


// 2회차 풀이

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]    // ex : 4
let m = input[1]    // ex : 2

var visit: [Bool] = Array(repeating: false, count: n)   // 방문 체크 배열
var array: [Int] = Array(repeating: 0, count: m)    // 출력할 배열

func recursive(_ number: Int) {
    if number == m {
        if array.sorted(by: <) != array {
            return
        }
        
        print(array.map({ String($0) }).joined(separator: " ") )
        return
    }
    
    for num in 0..<n {
        if visit[num] { continue }
        
        visit[num] = true
        array[number] = num + 1
        recursive(number + 1)
        visit[num] = false
    }
}


recursive(0)
