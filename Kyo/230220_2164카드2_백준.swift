//230220_2164카드2_백준

let number = Int(readLine()!)!

var queue = Array((1...number).reversed())
var dropQueue: [Int] = []
var drop = true

while true {
    if number == 1 { break } // 입력 1개일 떄 바로 탈출
    
    if !queue.isEmpty {
        let removeNumber = queue.removeLast()
        if drop {
            drop = false
            continue
        }
        dropQueue.append(removeNumber)
        drop = true
    } else {
        if dropQueue.count == 1 {
            break
        }
        queue = dropQueue.reversed()
        dropQueue.removeAll()
    }
}

if number == 1 {
    print(queue.first!)
} else {
    print(dropQueue.first!)
}
