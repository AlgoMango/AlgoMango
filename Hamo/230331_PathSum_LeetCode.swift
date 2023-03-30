import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    var isTrue: Bool = false
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        dfs(root: root, targetSum: targetSum, currentValue: 0)
        return isTrue
    }
    
    func dfs(root: TreeNode, targetSum: Int, currentValue: Int) {
        if root.left == nil && root.right == nil {
            if (currentValue + root.val) == targetSum && !isTrue {
                isTrue.toggle()
            }
            
            return
        }
        
        if let left = root.left {
            dfs(root: left, targetSum: targetSum, currentValue: currentValue + root.val)
        }
        
        if let right = root.right {
            dfs(root: right, targetSum: targetSum, currentValue: currentValue + root.val)
        }
    }
}
