/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var flag: Bool = false

    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil { return false }

        recur(root, targetSum)
        return flag
    }

    func recur(_ cur: TreeNode?, _ remainingVal: Int) {
        // 종료조건: leaf node 도착 시 종료
        if cur?.left == nil && cur?.right == nil {
            if remainingVal - cur!.val == 0 { flag = true }
            return
        }

        if cur?.left != nil { recur(cur?.left, remainingVal - cur!.val) }
        if cur?.right != nil { recur(cur?.right, remainingVal -  cur!.val) }
    }
}

// 외국인형 풀이
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.val == targetSum && root.left == nil && root.right == nil { return true }
        
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
    
}
