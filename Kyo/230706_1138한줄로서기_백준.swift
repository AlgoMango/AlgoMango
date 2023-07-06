// 3트..
// 230706_1138한줄로서기_백준

let number = Int(readLine()!)!
let input = readLine()!.split(separator : " " ).map{Int(String($0))!}
var answer = Array(repeating : -1, count : number)

// 앞에 필요한 빈자리라고 생각

for index in 0..<number {
    // 앞에 비워야할 칸 수
    let needEmpty = input[index]
    
    var empty = 0
    var applyIndex = 0
    
    for indexJ in 0..<answer.count {
        if answer[indexJ] != -1 {   // 이미 차있으면 다음
            continue
        }
        
        if empty == needEmpty { // 필요한 빈자리 모두 채웠을 경우
            applyIndex = indexJ
            break
        }
        
        if answer[indexJ] == -1 {  // 빈자리 += 1
            empty += 1
        }
    }

    answer[applyIndex] = index + 1
}

answer.forEach { print($0, terminator: " ") }
