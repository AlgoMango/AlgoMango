import Foundation

var array = Array(repeating: 0, count: 10)
var a: Int = Int(readLine()!)!
var b: Int = Int(readLine()!)!
var c: Int = Int(readLine()!)!

for i in String(a * b * c) {
    let index = Int(String(i))!
    array[index] += 1
}
 
for i in array {
    print(i)
}
