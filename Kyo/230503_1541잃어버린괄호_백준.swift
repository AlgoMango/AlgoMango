//230503_1541잃어버린괄호_백준
let input = readLine()!

var array = input.split(separator: "-").map { String($0) }
var startArray = array[0].split(separator: "+").map { String($0) }

var total = 0

// 시작부분 더하고
for item in startArray {
    total += Int(item)!
}

var minus = 0

for item in array[1..<array.count] {
    let tempItem = item.split(separator: "+").map { String($0) }
    
    for tempitem in tempItem {
        minus += Int(tempitem)!
    }
}

print(total - minus)
