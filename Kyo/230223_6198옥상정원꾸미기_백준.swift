//230223_6198옥상정원꾸미기_백준

let testCase = Int(readLine()!)!

var building: [(Int, Int)] = []
for _ in 0..<testCase {
    building.append(((Int(readLine()!)!), 0))
}
building = building.reversed()

var result = 0
var stack: [(Int, Int)] = [(1000000001, 0)]

// 1000001 2 12 4 7 3 10

for index in 0..<testCase {
    var cnt = 0
    while stack.last!.0 < building[index].0 {
        cnt += 1
        cnt += stack.last!.1
        building[index].1 = cnt
        stack.removeLast()
    }
    
    stack.append(building[index])
    result += building[index].1
}

print(result)
