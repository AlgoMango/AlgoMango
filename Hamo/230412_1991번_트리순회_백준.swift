import Foundation

let count = Int(readLine()!)!

var tree: [String: (left: String, right: String)] = [:]
var preorder: String = ""
var inorder: String = ""
var postorder: String = ""

for _ in 1...count {
    let input = readLine()!.components(separatedBy: " ")
    
    tree[input[0]] = (input[1], input[2])
}

func preorderTraversa(current: String) {
    if current == "." {
        return
    }
    
    preorder += current
    preorderTraversa(current: tree[current]!.left)
    preorderTraversa(current: tree[current]!.right)
}

func inorderTraversa(current: String) {
    if current == "." {
        return
    }
    
    inorderTraversa(current: tree[current]!.left)
    inorder += current
    inorderTraversa(current: tree[current]!.right)
}

func postorderTraversa(current: String) {
    if current == "." {
        return
    }
    
    postorderTraversa(current: tree[current]!.left)
    postorderTraversa(current: tree[current]!.right)
    postorder += current
}


preorderTraversa(current: "A")
print(preorder)

inorderTraversa(current: "A")
print(inorder)

postorderTraversa(current: "A")
print(postorder)
