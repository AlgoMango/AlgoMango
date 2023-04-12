//230412_1991트리순회_백준

let testcase = Int(readLine()!)!
var tree: [[String]] = []

var visit = Array(repeating: false, count: testcase)

for _ in 0..<testcase {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    tree.append(input)
}

var prefix  = ""    // 전위
var infix   = ""    // 중위
var postfix = ""    // 후위


func recursive(alpha: String, number: Int) {
    
    if number == testcase { return }
    
    var start = 0
    for index in 0..<testcase {
        if tree[index][0] == alpha {
            start = index
        }
    }
    
    if visit[start] { return }
    
    visit[start] = true
    prefix += tree[start][0]
    recursive(alpha: tree[start][1], number: number + 1)
    infix += tree[start][0]
    recursive(alpha: tree[start][2], number: number + 1)
    postfix += tree[start][0]
    
}

recursive(alpha: tree[0][0], number: 0)
print(prefix)
print(infix)
print(postfix)
