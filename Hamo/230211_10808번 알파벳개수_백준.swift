var array = Array(repeating: 0, count: 26)
let word = readLine()!

for index in word.utf16 {
    array[Int(index) - 97] += 1
}

for element in array {
    print(element, terminator: " ")
}
