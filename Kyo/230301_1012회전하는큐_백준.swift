//230301_1012회전하는큐_백준

// Queue 크기와 뽑으려는 수 갯수
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

// 뽑으려고 하는 수
let expect = readLine()!.split(separator: " ").map { Int(String($0))! }

var deque = Array(1...input[0])
var cnt = 0     // 연산 횟수
var index = 0

while index != expect.count {
    if deque.first! == expect[index] {
        deque.removeFirst()
        index += 1
    } else {
        if deque.firstIndex(of: expect[index])! <= (deque.count / 2) {
            while deque.first! != expect[index] {
                deque.append(deque.removeFirst())
                cnt += 1
            }
        } else {
            while deque.first! != expect[index] {
                deque.insert(deque.removeLast(), at: 0)
                cnt += 1
            }
        }
    }
}

print(cnt)
