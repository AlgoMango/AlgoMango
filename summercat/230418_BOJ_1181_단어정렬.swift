let n = Int(readLine()!)!
var words = Array(repeating: [String](), count: 51)

for _ in 0..<n {
    let word = readLine()!
    words[word.count].append(word)
}

for i in 1...50 {
    if words[i].isEmpty { continue }
    words[i] = Array(Set(words[i]))
    quickSort(&words[i], 0, words[i].count - 1)
}

func partition(_ arr: inout [String], _ left: Int, _ right: Int) -> Int {
    let pivot = arr[left]
    var left = left - 1
    var right = right + 1
    
    while true {
        left += 1
        while arr[left] < pivot { left += 1 }
        right -= 1
        while arr[right] > pivot { right -= 1 }
        
        if left >= right { return right }
        arr.swapAt(left, right)
    }
}

func quickSort(_ arr: inout [String], _ left: Int, _ right: Int) {
    if left < right {
        let pivot = partition(&arr, left, right)
        quickSort(&arr, left, pivot)
        quickSort(&arr, pivot + 1, right)
    }
}

let answer: [String] = words.flatMap { $0 }
answer.forEach { print($0) }
